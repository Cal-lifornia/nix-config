{ ... }: {
  imports = [
    ./cmp.nix
    ./lsp_qol.nix
    ./schemastore.nix
    ./treesitter.nix
  ];
  plugins.friendly-snippets.enable = true;
  plugins.tiny-inline-diagnostic = {
    enable = true;
    settings = {
      multilines.enabled = true;
      options.use_icons_from_diagnostic = true;
    };
  };
  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save = true;

    };
  };

}
