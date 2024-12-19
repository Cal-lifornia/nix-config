{ pkgs, lib, ... }:
{
  imports = [
    ../../home/linux
  ];
  programs.helix.enable = lib.mkForce false;
}
