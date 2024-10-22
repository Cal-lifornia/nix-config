{config, lib, pkgs, ...}:

{
  home.packages = with pkgs; [
    waybar
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
  };
}
