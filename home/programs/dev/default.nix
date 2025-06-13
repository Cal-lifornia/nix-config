{ pkgs, isLinuxDesktop, ... }:
{
  imports = [
    ./helix.nix
    ./debugging.nix
  ];
  home.packages =
    with pkgs;
    [
      # utils
      sqlite
      just # replacement for GNU Make
      neovim
      xmake # Alternative to Cmake

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
      wgsl-analyzer

      # formatters
      nixfmt-rfc-style
      mdformat
      black
    ]
    ++ (lib.optionals isLinuxDesktop [
      podman-desktop
      insomnia
      vscode
      ldtk
      libresprite
    ]);
}
