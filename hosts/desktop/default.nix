{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/desktop
  ];

  #service.xserver.videoDrivers = [ "amdgpu" ];
  boot = {
    #initrd.kernalModules = [ "amdgpu" ];
    loader = {

      efi = {
        canTouchEfiVariables = true;
        #efiSysMountPoint = "/boot/efi";
      };
      systemd-boot.enable = true;
      #grub = {
      #  enable = true;
      #  devices = [ "nodev" ];
      #  efiSupport = true;
      #  useOSProber = true;
      #  default = "saved";
      #};
    };
  };

  system.stateVersion = "24.05";

  networking.hostName = "hob-nixos";

  networking.networkmanager.enable = true;

}
