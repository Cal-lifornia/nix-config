{
  colorschemes = {
    catppuccin = {
      enable = true;
      settings = {
        custom_highlights = ''
          function(highlights)
            return {
            CursorLineNr = { fg = highlights.peach, style = {} },
            NavicText = { fg = highlights.text },
            }
          end
        '';
        flavour = "macchiato";
        transparent_background = true;
        term_colours = true;
        integrations = {
          mini = {
            enabled = true;
            indentscope_color = "rosewater";
          };
          gitsigns = true;
          noice = true;
          notify = true;
          treesitter_context = true;
        };
      };
    };
  };
}
