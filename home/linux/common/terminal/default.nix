{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    gnumake
    nano
    wget
    sysz
  ];
}
