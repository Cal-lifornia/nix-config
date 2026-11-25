{
  pkgs,
  isLinuxDesktop,
  isMac,
  pkgs-stable,
  config,
  ...
}:
{
  imports = [
    ./helix.nix
    ./debugging.nix
    ./nixvim
  ];

  home.packages =
    with pkgs;
    [

      # utils
      sqlite
      just # replacement for GNU Make
      caddy
      xcaddy
      devenv
      claude-code
      tig
      serpl
      regex-tui

      # xmake # Alternative to Cmake

      #languages
      rustup
      nodejs_22
      go
      deno

      # language servers
      jq-lsp
      docker-language-server
      dockerfile-language-server
      nil
      yaml-language-server
      taplo
      cargo-insta
      lua-language-server
      ruff
      marksman
      terraform-ls
      # plugins must share pylsp's python env to be loaded
      (python3.withPackages (ps: [
        ps.python-lsp-server
        ps.python-lsp-ruff
        ps.black
      ]))
      gopls
      wgsl-analyzer # also provides wgslfmt
      svelte-language-server
      glsl_analyzer
      nixd
      vscode-langservers-extracted
      superhtml
      tailwindcss-language-server
      just-lsp

      # formatters
      nixfmt
      mdformat
      dockerfmt
      kdlfmt
      clang-tools # clang-format
      gotools # goimports
      prettier # svelte formatting; prettier-plugin-svelte comes from the project's node_modules
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
