{ ... }: {
  imports = [
    ./cmp.nix
    ./lsp_qol.nix
    ./schemastore.nix
    ./treesitter.nix
    ./mini.nix
    ./yazi.nix
    ./git
    ./ux
  ];
  plugins.friendly-snippets.enable = true;
  plugins.tiny-inline-diagnostic = {
    enable = true;
    settings = {
      options = {
        multilines = {
          enabled = true;
          always_show = true;
        };
        use_icons_from_diagnostic = true;
        add_messages = {
          display_count = true;
        };
      };
    };
  };
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        nix = [
          "nixfmt"
        ];
      };
    };
  };

}
