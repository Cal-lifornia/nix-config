{ pkgs, lib, ... }:
{
  imports = [
    ./helix
    ./debugging.nix
  ];
  home.packages = with pkgs; [
    # utils
    sqlite
    just # replacement for GNU Make
    nodePackages.postcss-cli
    nodePackages.postcss
    hyperfine

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
    terraform-ls
    python313Packages.python-lsp-server
    python313Packages.python-lsp-ruff
    gopls

    # formatters
    nixfmt-rfc-style
    mdformat
    black
  ];
}
