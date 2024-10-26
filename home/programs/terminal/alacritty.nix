{pkgs, lib, ...}:
{
  programs = {
    alacritty = {
      enable = true;
      settings = {
          import = [
            "~/.config/themes/alacritty/catppuccin-macchiato.toml"
        ];

        font = {
          normal.family = "JetBrainsMono Nerd Font Mono";
          bold.family = "JetBrainsMono Nerd Font Mono";
          italic.family = "JetBrainsMono Nerd Font Mono";
          bold_italic.family = "JetBrainsMono Nerd Font Mono";
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
        }
      };
  };
  };
}
