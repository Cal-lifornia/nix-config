{ config, pkgs, ... }:
{
  imports = [
    ./zsh.nix
  ];

  programs = {

    bash.enable = true;

    direnv = {
      enable = true;
      enableZshIntegration = true;
    };

    nix-direnv.enable = true;
  };

}
