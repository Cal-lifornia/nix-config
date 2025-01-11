{ pkgs-unstable, ... }:
{

  programs = {
    zellij = {
      enable = true;
      package = pkgs-unstable.zellij;
      enableBashIntegration = true;
    };
  };
  home.file = {
    ".local/scripts/zellij-sessioniser" = {
      source = ./scripts/zellij-sessioniser.sh;
      executable = true;
    };
    ".local/scripts/yazi-picker" = {
      source = ./scripts/yazi-picker.sh;
      executable = true;
    };
  };

}
