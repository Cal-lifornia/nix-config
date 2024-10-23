{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    waybar
    swww
    wl-clipboard
    cliphist
    wlogout
    qt5.qtwayland
    qt6.qtwayland
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    xwayland.enable = true;
    extraConfig = ''
      source ~/.config/hypr/hypr.conf
    '';

  };
}
