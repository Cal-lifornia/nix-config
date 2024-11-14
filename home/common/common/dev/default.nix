{ pkgs, lib, ... }:
{
  imports = [
    ./helix
    ./kdlfmt.nix
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
    nixfmt-rfc-style
    nil
  ];

}
