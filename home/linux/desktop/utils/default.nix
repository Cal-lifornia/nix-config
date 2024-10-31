{ pkgs, ... }:
{
  imports = [
    ./xdg.nix
    ./cava.nix
  ];

  home.packages = with pkgs; [
    appimage-run
    xflux
    catimg
  ];
}
