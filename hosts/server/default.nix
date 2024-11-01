{ config, pkgs, ... }:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../../nixos/server
  ];

  system.stateVersion = "24.05";

  networking.networkmanager.enable = true;
}
