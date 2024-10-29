{ pkgs, lib, ... }: {
  imports = [ ./alacritty.nix ];
  home.packages = with pkgs; [
    #utils
    ranger
    git
    rustup
    gnumake
    catimg
    curl
    appimage-run
    xflux
    dunst
    pavucontrol
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
