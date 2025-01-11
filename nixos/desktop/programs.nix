{ config, pkgs-unstable, ... }:

{
  xdg.portal = {
    enable = true;
    wlr.enable = false;
    xdgOpenUsePortal = false;
    extraPortals = [
      pkgs-unstable.xdg-desktop-portal-hyprland
      pkgs-unstable.xdg-desktop-portal-gtk
    ];
  };

  programs = {

    hyprland = {
      enable = true;
      package = pkgs-unstable.hyprland;

      xwayland = {
        enable = true;
      };

      portalPackage = pkgs-unstable.xdg-desktop-portal-hyprland;
    };

  };

}
