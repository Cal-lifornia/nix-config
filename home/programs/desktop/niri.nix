{ ... }:
let
  config_path = ./niri_config.kdl;
in
{
  home.file.".config/niri".source = "${config_path}";

  wayland.windowManager.niri = {
    enable = true;
    systemd.enable = true;
  };
}
