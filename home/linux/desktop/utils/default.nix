{ pkgs, ... }:
{
  imports = [
    ./xdg.nix
  ];

  home.packages = with pkgs; [
    appimage-run
    xflux
    catimg
  ];
}
