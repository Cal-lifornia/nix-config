{ pkgs, ... }:
{
  programs = {
    rofi = {
      enable = true;
      location = "center";
      font = "Noto Sans";
      catppuccin = {
        enable = true;
        flavor = "macchiato";
      };
    };
  };
}
