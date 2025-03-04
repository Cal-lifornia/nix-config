{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    libsForQt5.qt5.qtwayland
  ];

  services.flatpak.enable = true;

  xdg.autostart.enable = true;
  xdg.portal = {
    enable = true;
    config.common.default = "gtk";
    wlr.enable = false;
    xdgOpenUsePortal = false;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  programs = {
    uwsm.enable = true;
    hyprland = {
      enable = true;
      withUWSM = true;

      xwayland = {
        enable = true;
        # hidpi = true;
      };

      # portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };

  };
  environment.sessionVariables = {
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
  };

}
