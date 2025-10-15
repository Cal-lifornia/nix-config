{ pkgs, ... }:
{
  home.packages = with pkgs; [
    rofi
    rofi-calc
  ];
  programs = {

    rofi = {
      # enable = true;
      location = "center";
      plugins = with pkgs; [
        rofi-calc
      ];
      modes = [
        "drun"
        "window"
        "run"
        "ssh"
        "calc"
        "keys"
        "combi"
        "filebrowser"
        "recursivebrowser"
      ];

      font = "Noto Sans";
    };
  };
  # catppuccin.rofi = {
  #   enable = true;
  #   flavor = "macchiato";
  # };
}
