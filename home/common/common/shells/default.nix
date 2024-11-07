{ config, pkgs, ... }:
{
  imports = [
    ./zsh.nix
    ./starship.nix
  ];

  home.packages = with pkgs; [
    zsh-powerlevel10k
    nnn
    curl
  ];

  programs = {

    bash.enable = true;
    nushell = {
      enable = true;
    };
    ripgrep.enable = true;
    fd.enable = true;
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
    };
    bat = {
      enable = true;
      catppuccin = {
        enable = true;
        flavor = "mocha";
      };
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
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
  };

}
