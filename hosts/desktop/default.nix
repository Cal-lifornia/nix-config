{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    systemd-boot.enable = true;
  };

  system.stateVersion = "24.05";

  networking.hostName = "hob-nixos";

  networking.networkmanager.enable = true;
  
}
