{ pkgs, helix-master, ... }:
{
  nixpkgs = {
    overlays = [
      helix-master.overlays.default
    ];
  };
  programs = {
    helix = {
      enable = true;
      defaultEditor = true;
      package = helix-master.packages.${pkgs.system}.default;
      settings = {
        theme = "catppuccin_macchiato";
        keys = {
          normal = {
            "C-s" = ":w"; # Ctrl + s to save file
            "C-S-s" = ":wa"; # Ctrl + Shift + s to save all buffers
            "C-y" = {
              y = ":sh zellij run -c -f -x 10% -y 10% --width 80% --height 80% -- bash ~/.config/helix/yazi-picker.sh open";
              # Open the file(s) in a vertical pane
              v = ":sh zellij run -c -f -x 10% -y 10% --width 80% --height 80% -- bash ~/.config/helix/yazi-picker.sh vsplit";
              # Open the file(s) in a horizontal pane
              h = ":sh zellij run -c -f -x 10% -y 10% --width 80% --height 80% -- bash ~/.config/helix/yazi-picker.sh hsplit";
            };
          };
        };
        editor = {
          bufferline = "always";
          statusline = {
            left = [
              "mode"
              "spinner"
              "read-only-indicator"
              "file-modification-indicator"
            ];
            center = [
              "file-absolute-path"
              "file-name"
            ];
            mode = {
              normal = "NORMAL";
              insert = "INSERT";
              select = "SELECT";
            };
          };
        };
      };
    };
  };
}
