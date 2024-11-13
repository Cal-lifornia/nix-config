{ pkgs, ... }:
{

  programs = {
    zellij = {
      enable = true;
      enableBashIntegration = true;
    };
  };
  home.file.".local/scripts/zellij-sessioniser" = {
    source = ./scripts/zellij-sessioniser.sh;
    executable = true;
  };
}
