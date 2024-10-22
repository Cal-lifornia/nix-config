{pkgs, lib, ...}:
{
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
  ];
  
  programs = {
    zoxide = {
      enable= true;
      enableBashIntegration = true;
      enableZshIntegration = true;
  };
    bat.enable = true;
    fzf.enable = true;
    alacritty.enable = true;
  };
}
