{ config, pkgs, ... }:
{
  imports = [
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    zsh-powerlevel10k
  ];

  programs = {

    bash.enable = true;

  };

}
