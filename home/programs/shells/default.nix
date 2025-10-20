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
    bash
    fastfetch
  ];
  catppuccin = {
    bat = {
      enable = true;
      flavor = "macchiato";
    };
    nushell = {
      enable = true;
      flavor = "macchiato";
    };
    # atuin = {
    #   enable = true;
    #   flavor = "macchiato";
    # };
  };
  home.shellAliases = {
    cat = "bat --paging=never";
    zs = "~/.local/scripts/zellij-sessioniser";
  };

  programs = {
    navi = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
    eza = {
      enable = true;
      icons = "auto";
      enableBashIntegration = true;
      enableZshIntegration = true;
      enableNushellIntegration = true;
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
      enableNushellIntegration = true;
    };
  };

}
