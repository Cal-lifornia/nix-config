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
          option_as_alt = "Both";
        };
        shell = {
          program = "/usr/bin/env zsh";
        };
        keyboard.bindings = [
          {
            key = "Right";
            mods = "Alt";
            chars = "\u001BF";
          }
          {
            key = "Left";
            mods = "Alt";
            chars = "\u001BB";
          }
        ];
      };
    };
  };
}
