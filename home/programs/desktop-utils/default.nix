{ pkgs, ... }:
{
  imports = [
    ./xdg.nix
    ./cava.nix
    ./rofi.nix
    ./clipboard.nix
  ];

  home.packages = with pkgs; [
    appimage-run
    xflux
    catimg
    remmina
    sticky-notes
  ];
}
