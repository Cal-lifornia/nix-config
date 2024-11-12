{ pkgs, ... }:
{
  programs = {
    helix = {
      enable = true;
      settings = {
        theme = "catppuccin_macchiato";
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
