{ pkgs, lib, ... }:
{
  imports = [ ./alacritty.nix ];
  home.packages = with pkgs; [
    #utils
    git
    rustup
    curl
    lazygit
    ripgrep
    glow
    neovim
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
