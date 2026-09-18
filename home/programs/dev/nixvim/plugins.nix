{ config, ... }:
{
  programs.nixvim.plugins = {
    friendly-snippets = {
      enable = true;
    };

    telescope = {
      enable = true;
      extensions = {
        fzf-native.enable = true;
        file-browser.enable = true;
        zoxide.enable = true;
      };
    };
    # noice.enable = true;
    # nui.enable = true;
    blink-ripgrep.enable = true;
    blink-cmp = {
      enable = true;
      settings = {
        completion.documentation.auto_show = false;
        completion.list.selection.preselect = false;
        keymap.preset = "super-tab";
        signature.enabled = true;
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
    treesitter = {
      enable = true;
      highlight.enable = true;
      indent.enable = true;

      grammarPackages = with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
        rust
        bash
        json
        lua
        make
        markdown
        nix
        regex
        toml
        vim
        vimdoc
        xml
        yaml
      ];
    };
    # conform-nvim.enable = true;
  };
}
