{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    appimage-run
    xflux
    dunst
    pavucontrol
    gnumake
    catimg
  ];
}
