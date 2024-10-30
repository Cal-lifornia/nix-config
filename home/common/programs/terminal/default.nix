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
  ];

  programs = {
    zoxide = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
    };
    bat.enable = true;
    fzf.enable = true;
  };
}
