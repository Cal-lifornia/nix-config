{ pkgs, ... }:
{
  imports = [
    ./git.nix
    ./yazi.nix
    ./multiplexers
  ];

  home.packages = with pkgs; [
    eza
  ];

}
