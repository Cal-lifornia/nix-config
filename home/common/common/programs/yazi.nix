{ pkgs, ... }:
{
  programs = {
    yazi = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };
  };
  catppuccin = {
    yazi = {
      enable = true;
      flavor = "macchiato";
    };
  };
}
