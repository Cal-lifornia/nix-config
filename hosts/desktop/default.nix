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

      # efi = {
      #   canTouchEfiVariables = true;
      #   efiSysMountPoint = "/boot/EFI";
      # };
      systemd-boot.enable = true;
      # grub = {
      #   enable = true;
      #   devices = [
      #     "nodev"
      #   ];
      #efiInstallAsRemovable = true;
      #   efiSupport = true;
      #   useOSProber = true;
      #   default = "saved";
      # };
    };
  };

  system.stateVersion = "24.11";

  networking.hostName = "hob-nixos";

  networking.networkmanager.enable = true;

}
