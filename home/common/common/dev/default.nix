{ pkgs, lib, ... }:
{
  imports = [
    ./helix
  ];
  home.packages = with pkgs; [
    # utils
    sqlite
    just # replacement for GNU Make

    #languages
    rustup
    neovim
    nodejs_22
    go

    # language servers
    nil
    bash-language-server
    yaml-language-server
    taplo
    cargo-insta
    lua-language-server
    ruff
    marksman

    # formatters
    nixfmt-rfc-style
  ];
}
