{ ... }: {
  imports = [
    # Core Functionality
    ./plugins

    # Settings
    ./lsp.nix
    ./options.nix
    ./keymaps.nix
    ./colourscheme.nix
  ];
}
