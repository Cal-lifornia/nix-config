{ config, pkgs, ... }:

{

  services = {
    displayManager = {
      defaultSession = "hyprland-uwsm";
      sddm.enable = true;
      sddm.wayland.enable = true;
      sddm.enableHidpi = true;
      sddm.package = pkgs.kdePackages.sddm;
      # sddm.catppuccin = {
      #   enable = true;
      #   flavor = "frappe";
      #   font = "Noto Sans";
      # };
      sddm.theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
    };
  };
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
  environment.systemPackages = with pkgs; [
    hyprpaper
    xdg-desktop-portal-gtk
    xdg-desktop-portal-wlr
    nwg-displays
    wdisplays
    libsForQt5.qt5.qtwayland
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
