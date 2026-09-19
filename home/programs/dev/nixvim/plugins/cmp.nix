{
  plugins = {
    blink-ripgrep.enable = true;
    blink-cmp = {
      enable = true;
      settings = {
        completion.documentation.auto_show = false;
        completion.list.selection.preselect = false;
        signature.enabled = true;
        keymap = {
          preset = "enter";
          "<C-u>" = [
            "scroll_documentation_up"
            "fallback"
          ];
          "<C-d>" = [
            "scroll_documentation_down"
            "fallback"
          ];
        };
        documentation.auto_show = true;
        sources = {
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
            "ripgrep"
          ];
          providers = {
            buffer.score_offset = -7;
            lsp.fallbacks = [ ];
            ripgrep = {
              module = "blink-ripgrep";
              name = "Ripgrep";
              async = true;
              score_offset = 100;
            };
          };
        };
      };
    };
  };
}
