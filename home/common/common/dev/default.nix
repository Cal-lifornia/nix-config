{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    #utils
    git
    rustup
    curl
    lazygit
    glow
    neovim
    nodejs_22
    go
    unzip
    sqlite
  ];

}
