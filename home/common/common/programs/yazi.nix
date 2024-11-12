{ pkgs, ... }:
{
  programs = {
    yazi = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
      catppuccin = {
        enable = true;
        flavor = "macchiato";
      };
    };
  };
}
