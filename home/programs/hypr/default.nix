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
    ./notifications.nix
    hyprland.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    swappy
    swww
    waybar
    qt5.qtwayland
    qt6.qtwayland
    swayidle
    swaylock-effects
    grimblast
    hyprcursor
    wlogout
    hyprpaper
  ];
}
