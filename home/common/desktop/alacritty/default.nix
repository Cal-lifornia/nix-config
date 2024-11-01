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
          option_as_alt = "Both";
        };
        shell = {
          program = "/usr/bin/env";
          args = [ "zsh" ];
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
        env = {
          TERM = "xterm-256color";
        };
      };
    };
  };
}
