{
  pkgs,
  helix-master,
  lib,
  ...
}:
{
  nixpkgs = {
    overlays = [
      helix-master.overlays.default
    ];
  };
  programs = {
    helix = {
      enable = true;
      defaultEditor = true;
      package = helix-master.packages.${pkgs.system}.default;
      languages = {
        grammar = [
          {
            name = "csv";
            source = {
              git = "https://github.com/weartist/rainbow-csv-tree-sitter";
              rev = "d3dbf916446131417e4c2ea9eb8591b23b466d27";
            };
          }
          {
            name = "asm";
            source = {
              git = "https://github.com/SethBarberee/tree-sitter-asm";
              rev = "eee056ff31ea758eaa0ff00f0ec335f156cc5ebe";
            };
          }
        ];
        language = [
          {
            name = "nix";
            auto-format = true;
            formatter = {
              command = "nixfmt";
            };
          }
          {
            name = "go";
            auto-format = true;
            formatter = {
              command = "goimports";
            };
          }
          {
            name = "toml";
            auto-format = true;
            formatter = {
              command = "taplo";
              args = [
                "fmt"
                "-"
              ];
            };
          }
          {
            name = "yaml";
            auto-format = true;
          }
          {
            name = "markdown";
            auto-format = true;
          }
          {
            name = "hcl";
            auto-format = true;
            language-servers = [ "terraform-ls" ];
            language-id = "terraform";
          }
          {
            name = "tfvars";
            auto-format = true;
            language-servers = [ "terraform-ls" ];
            language-id = "terraform-vars";
          }
          {
            name = "make";
            auto-format = false;
            indent = {
              tab-width = 4;
              unit = "t";
            };
          }
          {
            name = "armasm";
            file-types = [ "ms" ];
            scope = "source.ms";
            comment-tokens = [ "//" ];
          }
          {
            name = "csv";
            file-types = [ "csv" ];
            scope = "source.csv";
          }
          {
            name = "python";
            language-servers = [ "pylsp" ];
            roots = [ ".git" ];
            workspace-lsp-roots = [ "src/updater" ];
            auto-format = true;
          }

        ];
        language-server = {
          rust-analyzer.config.check = {
            command = "clippy";
          };
          pylsp.config.pylsp.plugins = {
            black.enabled = true;
            flake8.enabled = false;
            autopep8.enabled = false;
            mccabe.enabled = false;
            pycodestyle.enabled = false;
            pyflakes.enabled = false;
            pylint.enabled = false;
            yapf.enabled = false;
            ruff = {
              enabled = true;
              ignore = [ "F401" ];
              lineLength = 120;
            };
          };
          yaml-language-server.config.yaml = {
            format = {
              enable = true;
            };
            validation = true;
          };
          terraform-ls = {
            command = "terraform-ls";
            args = [
              "serve"
            ];
          };

        };

      };
      settings = {
        theme = "catppuccin_macchiato";
        keys = {
          normal = {
            # Shift + left/right arrow to move buffers
            "S-left" = "goto_previous_buffer";
            "S-right" = "goto_next_buffer";

            "C-j" = "save_selection";

            "C-s" = ":w"; # Ctrl + s to save file
            "C-S-s" = ":wa"; # Ctrl + Shift + s to save all buffers
            "C-y" = {
              "y" =
                ":sh zellij run -c -f -x 10% -y 10% --width 80% --height 80% -- ~/.local/scripts/yazi-picker open";
              # Open the file(s) in a vertical pane
              "v" =
                ":sh zellij run -c -f -x 10% -y 10% --width 80% --height 80% -- ~/.local/scripts/yazi-picker vsplit";
              # Open the file(s) in a horizontal pane
              "h" =
                ":sh zellij run -c -f -x 10% -y 10% --width 80% --height 80% -- ~/.local/scripts/yazi-picker hsplit";

              "g" = ":sh zellij run -c -i -x 10% -y 10% --width 80% --height 80% -- lazygit";
            };
          };
        };
        editor = {
          line-number = "relative";
          continue-comments = false;
          cursor-shape.insert = "bar";
          bufferline = "always";
          statusline = {
            left = [
              "mode"
              "spinner"
              "read-only-indicator"
              "file-modification-indicator"
              "version-control"
            ];
            center = [
              "file-name"
            ];
            mode = {
              normal = "NORMAL";
              insert = "INSERT";
              select = "SELECT";
            };
          };
          inline-diagnostics = {
            cursor-line = "hint";
            other-lines = "warning";
          };
        };
      };
    };
  };
}
