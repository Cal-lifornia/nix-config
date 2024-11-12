{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./yazi.nix
    ./zellij.nix
  ];

  home.packages = with pkgs; [
    eza
  ];

}
