{ pkgs, ... }:
{

  home.packages = with pkgs; [
    zellij
  ];

  programs = {
    zellij = {
      enable = true;
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
