{ config, pkgs-unstable, ... }:
{
  environment.systemPackages = with pkgs-unstable; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    unzip
    dunst
    steamtinkerlaunch
    # cava
    vial
    kitty
    nwg-displays
    wdisplays
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtsvg
  ];
}
