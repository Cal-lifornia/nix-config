{
  pkgs,
  isLinuxDesktop,
  isMac,
  pkgs-stable,
  config,
  ...
}:
# let
#   wgsl-analyzer = import ./wgslanalyzer.nix {
#     inherit pkgs-stable;
#   };
# in
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
      caddy
      xcaddy
      # xmake # Alternative to Cmake

      #languages
      rustup
      nodejs_22
      go
      deno

      # language servers
      nil
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
      wgsl-analyzer
      glsl_analyzer
      nixd
      vscode-langservers-extracted
      superhtml
      tailwindcss-language-server

      # formatters
      nixfmt
      mdformat
      black
    ]
    ++ (lib.optionals isLinuxDesktop [
      podman-desktop
      insomnia
      vscode
      ldtk
      libresprite
      (config.lib.nixGL.wrap hoppscotch)
    ])
    ++ (lib.optionals isMac [
      hoppscotch
    ])
    ++ (with pkgs-stable; [
      bash-language-server
    ]);
}
