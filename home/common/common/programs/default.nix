{ pkgs, ... }:
{
  imports = [
    ./git.nix
  ];

  home.packages = with pkgs; [
    eza
    yazi
  ];

  programs = {
    zellij = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
  };
}
