{ ... }:
let
  config_path = ./niri_config.kdl;
in
{
  home.file.".config/niri/config.kdl" = "${config_path}";

  wayland.windowManager.niri = {
    enable = true;
    systemd.enable = true;
  };
}
