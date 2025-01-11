{ pkgs-unstable, ... }:
{
  programs = {
    yazi = {
      enable = true;
      package = pkgs-unstable.yazi;
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
