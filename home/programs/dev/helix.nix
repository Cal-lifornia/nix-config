{
  pkgs,
  helix-master,
  isLinuxDesktop,
  ...
}:
{
  imports = [ ./helix-languages.nix ];
  nixpkgs = {
    overlays = [
      helix-master.overlays.default
    ];
  };
  programs = {
    helix = {
      enable = true;
      defaultEditor = true;
      package = helix-master.packages.${pkgs.stdenv.hostPlatform.system}.default;
      # themes = {
      #   catppuccin_transparent = {
      #     inherits = "catppuccin_macchiato";
      #     "ui.background" = { };
      #   };
      # };
      settings = {
        theme = if isLinuxDesktop then "catppuccin_transparent" else "catppuccin_macchiato";
        keys = {
          normal = {
            # Shift + left/right arrow to move buffers
            "S-left" = "goto_previous_buffer";
            "S-right" = "goto_next_buffer";

            "C-j" = "save_selection";

            "C-s" = ":w"; # Ctrl + s to save file
            "C-S-s" = ":wa"; # Ctrl + Shift + s to save all buffers
            # "C-g" = ":sh txde git '%{buffer_name}'";
            "C-y" = {
              "y" =
                ":sh zellij run -n Yazi -c -f -x 10%% -y 10%% --width 80%% --height 80%% -- ~/.local/scripts/yazi-picker open %{buffer_name}";
              "c" = ":open %sh{yazi-picker '%{buffer_name}' }";
              "v" = [
                ":open %sh{yazi --chooser-file=/dev/stdout | tr -d '\\n'}"
                ":redraw"
                ":set mouse false"
                ":set mouse true"
              ];
            };
            "space" = {
              ";" = ":sh txde filetree '%{buffer_name}'";
              "v" = {
                "b" = ":sh txde blame '%{buffer_name}' '%{cursor_line}'";
                "x" = ":sh txde regex";
                "g" = ":sh txde git '%{buffer_name}'";
              };
            };
          };
        };
        editor = {
          shell = [
            "/usr/bin/env"
            "zsh"
            "-c"
          ];
          color-modes = true;
          auto-format = true;
          # soft-wrap.enable = true;
          # soft-wrap.wrap-at-text-width = true;
          line-number = "relative";
          continue-comments = true;
          cursor-shape.insert = "bar";
          bufferline = "always";
          end-of-line-diagnostics = "hint";
          statusline = {
            left = [
              "mode"
              "spinner"
              "read-only-indicator"
              "file-modification-indicator"
              "version-control"
            ];
            center = [
              "file-name"
            ];
            mode = {
              normal = "NORMAL";
              insert = "INSERT";
              select = "SELECT";
            };
          };
          inline-diagnostics = {
            cursor-line = "hint";
            other-lines = "disable";
          };
          rainbow-brackets = true;
        };
      };
    };
  };
}
