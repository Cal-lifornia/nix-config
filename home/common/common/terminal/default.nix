{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    #utils
    git
    rustup
    curl
    lazygit
    ripgrep
    glow
    neovim
    nodejs_22
    go
    unzip
  ];

  programs = {
    ripgrep.enable = true;
    fd.enable = true;
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
    bat.enable = true;
    fzf = {
      enable = true;
      enableZshIntegration = true;
      enableBashIntegration = true;
    };
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

  };
}
