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
    ./swappy.nix
  ];
}
