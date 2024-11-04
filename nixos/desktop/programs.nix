{ config, pkgs, ... }:

{
  services.flatpak.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = false;
    xdgOpenUsePortal = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };

    hyprland = {
      enable = true;

      xwayland = {
        enable = true;
      };

      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };

  };

}
