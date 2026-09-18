{ ... }:
{
  programs.nixvim.plugins = {
    # lsp-lines.enable = true;
    lsp-progress.enable = true;
    lsp-format.enable = true;
    lsp = {
      servers = {
        nixd.enable = true;
        nil_ls.enable = true;
        rust_analyzer = {
          enable = true;
          installCargo = false;
          installRustc = false;
          installRustfmt = false;
        };
        just.enable = true;
        jqls.enable = true;
        lua_ls.enable = true;
        marksman.enable = true;
        taplo.enable = true;
        docker_language_server.enable = true;
        docker_compose_language_service.enable = true;
      };
    };
    lspconfig.enable = true;

    lspkind.enable = true; # for symbols
    lspsaga = {
      enable = true;
      settings = {
        symbol_in_winbar.enable = true;
        beacon.enable = true;
        callhierarchy = false;
        code_action.enable = true;
        definition.enable = true;
        diagnostic = {
          enable = true;
          diagnostic_only_current = true;
        };
        finder.enable = false;
        hover.enable = true;
        implement.enable = true;
        lightbulb = {
          enable = true;
          sign = false;
        };
        outline = {
          enable = true;
          auto_preview = false;
          close_after_jump = true;
        };
        rename.enable = true;
      };
    };
  };
}
