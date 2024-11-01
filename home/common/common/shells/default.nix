{ config, pkgs, ... }:
{
  imports = [
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    zsh-powerlevel10k
    curl
  ];

  programs = {

    bash.enable = true;
    ripgrep.enable = true;
    fd.enable = true;
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };
    bat.enable = true;
    fzf = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
      enableNushellIntegration = true;
    };
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
      enableNushellIntegration = true;
    };
    carapace = {
      enable = true;
      enableNushellIntegration = true;
    };
    starship = {
      enable = true;
      enableNushellIntegration = true;
    };
  };

}
