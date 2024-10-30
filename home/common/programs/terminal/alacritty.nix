{ pkgs, lib, ... }:
{
  programs = {
    alacritty = {
      enable = true;
      settings = {
        import = [
          "~/.config/themes/alacritty/catppuccin-macchiato.toml"
        ];

        font = {
          normal.family = "JetBrainsMono Nerd Font";
          bold.family = "JetBrainsMono Nerd Font";
          italic.family = "JetBrainsMono Nerd Font";
          bold_italic.family = "JetBrainsMono Nerd Font";
          size = 14;
        };

        window = {
          padding = {
            x = 10;
            y = 10;
          };
          opacity = 0.9;
        };
        shell = {
          program = "/usr/bin/env zsh";
        };
      };
    };
  };
}
