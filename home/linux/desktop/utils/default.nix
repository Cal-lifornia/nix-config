{ pkgs, ... }:
{
  imports = [
    ./xdg.nix
    ./cava.nix
    ./rofi.nix
  ];

  home.packages = with pkgs; [
    appimage-run
    xflux
    catimg
  ];
}
