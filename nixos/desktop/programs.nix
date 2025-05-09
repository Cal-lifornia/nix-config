{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # cava
    vial
    kitty
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtsvg
  ];
}
