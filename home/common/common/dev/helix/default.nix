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
      package = helix-master.packages.${pkgs.system}.default;
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
