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
