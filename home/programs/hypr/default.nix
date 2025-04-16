{
  config,
  lib,
  pkgs,
  hyprland,
  ...
}:

{
  imports = [
    ./hyprland-environment.nix
    ./dunst.nix
    hyprland.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    swappy
    swww
  ];
}
