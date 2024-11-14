{ pkgs, lib, ... }:
{
  imports = [
    ./helix
  ];
  home.packages = with pkgs; [
    #utils
    rustup
    curl
    lazygit
    glow
    neovim
    nodejs_22
    go
    unzip
    sqlite
    lua-language-server
  ];

}
