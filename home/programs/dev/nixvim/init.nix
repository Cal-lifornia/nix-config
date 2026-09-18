_: {
  imports = [

    # Core Functionality
    ./plugins/mini.nix
    ./plugins/yazi.nix

    # Code/LSP integration
    ./plugins/code

    # UX improvements
    ./plugins/ux/noice.nix
    ./plugins/ux/toggleterm.nix
    ./plugins/ux/cutlass.nix

    # Git integration
    ./plugins/git/lazygit.nix
    ./plugins/git/gitgutter.nix

    # Settings
    ./lsp.nix
    ./options.nix
    ./keymaps.nix
    ./colourscheme.nix
  ];
}
