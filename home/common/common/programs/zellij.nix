{ pkgs, ... }:
{

  programs = {
    zellij = {
      enable = true;
      enableBashIntegration = true;
      settings = {
        theme = "catppuccin-macchiato";
      };
    };
  };
}
