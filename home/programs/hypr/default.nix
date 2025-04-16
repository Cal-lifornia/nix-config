{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./hyprland-environment.nix
    ./dunst.nix
  ];

  home.packages = with pkgs; [
    swappy
    swww
  ];
}
