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
      systemd-boot.enable = true;
    };
  };

  system.stateVersion = "24.05";

  networking.hostName = "hob-nixos";

  networking.networkmanager.enable = true;

}
