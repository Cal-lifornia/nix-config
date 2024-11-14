{ pkgs, lib, ... }:
{
  imports = [
    ./helix
  ];
  home.packages = with pkgs; [
    #utils
    (callPackage ./kdlfmt.nix { })
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
