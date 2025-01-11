{ config, pkgs-unstable, ... }:

{

  environment.systemPackages = with pkgs-unstable; [
    hyprpaper
    libnotify
    qt5.qtwayland
    qt6.qtwayland
    swayidle
    swaylock-effects
    wlogout
    wl-clipboard
    wofi
    waybar
    grimblast
    cliphist
    hyprcursor
  ];
}
