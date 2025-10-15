{ pkgs, ... }:
{
  programs = {
    rofi = {
      enable = true;
      location = "center";
      plugins = with pkgs; [
        rofi-calc
      ];

      # font = "Noto Sans";
      # catppuccin = {
      #   enable = true;
      #   flavor = "macchiato";
      # };
    };
  };
}
