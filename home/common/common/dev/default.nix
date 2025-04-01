{ pkgs, ... }:
{
  imports = [
    ./helix
    ./debugging.nix
    # ./gamedev.nix
  ];
  home.packages = with pkgs; [
    # utils
    sqlite
    just # replacement for GNU Make
    neovim

    #languages
    rustup
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
    nodePackages.vscode-json-languageserver

    # formatters
    nixfmt-rfc-style
    mdformat
    black
  ];
}
