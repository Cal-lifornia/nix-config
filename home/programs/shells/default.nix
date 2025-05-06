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
    eza
  ];
  catppuccin = {
    bat = {
      enable = true;
      flavor = "macchiato";
    };
    # atuin = {
    #   enable = true;
    #   flavor = "macchiato";
    # };
  };

  programs = {
    navi = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
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
    atuin = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = false;
    };
  };

}
