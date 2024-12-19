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
    opentofu

    # language servers
    nil
    bash-language-server
    yaml-language-server
    taplo
    cargo-insta
    lua-language-server
    ruff
    marksman
    terraform-ls

    # formatters
    nixfmt-rfc-style
    mdformat
  ];
}
