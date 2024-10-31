{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/system.nix
  ];

  #service.xserver.videoDrivers = [ "amdgpu" ];
  boot = {
    #initrd.kernalModules = [ "amdgpu" ];
    loader = {

      efi = {
        canTouchEfiVariables = true;
        #        efiSysMountPoint = "/boot/efi";
      };
      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        extraEntries = ''
          menuentry "Windows" {
            insmod part_gpt
            insmod fat
            insmod search_fs_uuid
            insmod chain
            search --fs-uuid --set=root $FS_UUID
            chainloader /EFI/Microsoft/Boot/bootmgfw.efi
          }
        '';
        version = 2;
        useOSProber = true;
      };
    };
  };

  system.stateVersion = "24.05";

  networking.hostName = "hob-nixos";

  networking.networkmanager.enable = true;

}
