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
    ./waybar.nix
    ./notifications.nix
    hyprland.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    swappy
    swww
  ];
}
