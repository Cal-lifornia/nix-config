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
            name = "c";
            file-types = [
              "c"
              "h"
            ];
            formatter = {
              command = "clang-format";
            };
            auto-format = true;
          }
          {
            name = "wgsl";
            formatter = {
              command = "wgslfmt";
            };
            auto-format = true;
          }
          {
            name = "cpp";
            file-types = [
              "cpp"
              "cc"
              "cxx"
              "hpp"
              "hcc"
              "hxx"
            ];
            formatter = {
              command = "clang-format";
            };
            auto-format = true;
          }
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
            comment-tokens = [
              "-"
              "+"
              "*"
              "- [ ]"
              ">"
            ];
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
            name = "svelte";
            language-servers = [
              "svelte-server"
              "tailwindcss-ls"
            ];
            auto-format = true;
            formatter = {
              command = "prettier";
              args = [
                "--plugin"
                "prettier-plugin-svelte"
                "parser"
                "svelte"
              ];
            };
          }
          {
            name = "javascript";
            auto-format = true;
            roots = [
              "deno.json"
              "deno.jsonc"
              "package.json"
            ];
            language-servers = [
              "deno-lsp"
              "tailwindcss-ls"
            ];
            file-types = [
              "js"
              "jsx"
            ];
            formatter = {
              command = "deno";
              args = [
                "fmt"
                "-"
                "--ext"
                "js"
              ];
            };
          }
          {
            name = "json";
            auto-format = true;
            formatter = {
              command = "deno";
              args = [
                "fmt"
                "-"
                "--ext"
                "json"
              ];
            };
          }
          {
            name = "typescript";
            roots = [
              "deno.json"
              "deno.jsonc"
              "package.json"
            ];
            language-servers = [
              "deno-lsp"
              "tailwindcss-ls"
            ];
            file-types = [
              "ts"
              "tsx"
            ];
            auto-format = true;
            formatter = {
              command = "deno";
              args = [
                "fmt"
                "-"
                "--ext"
                "ts"
              ];
            };
          }
          {
            name = "css";
            language-servers = [
              "tailwindcss-ls"
              "vscode-css-language-server"
            ];
            auto-format = true;
            formatter = {
              command = "deno";
              args = [
                "fmt"
                "-"
                "--ext"
                "css"
              ];
            };
          }
          {
            name = "html";
            language-servers = [
              "vscode-html-language-server"
              "superhtml"
              "tailwindcss-ls"
            ];
            auto-format = true;
            formatter = {
              command = "deno";
              args = [
                "fmt"
                "-"
                "--ext"
                "html"
              ];
            };
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
            formatter = {
              command = "black";
              args = [
                "--quiet"
                "-"
              ];
            };
            auto-format = true;
          }

        ];
        language-server = {
          rust-analyzer.config.check = {
            command = "clippy";
          };
          deno-lsp = {
            command = "deno";
            args = [ "lsp" ];
            config.deno.enable = true;
          };
          pylsp.config.pylsp.plugins = {
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
                ":sh zellij run -n Yazi -c -f -x 10%% -y 10%% --width 80%% --height 80%% -- ~/.local/scripts/yazi-picker open %{buffer_name}";
              # Open the file(s) in a vertical pane
              "v" =
                ":sh zellij run -n Yazi -c -f -x 10%% -y 10%% --width 80%% --height 80%% -- ~/.local/scripts/yazi-picker vsplit %{buffer_name}";
              # Open the file(s) in a horizontal pane
              "h" =
                ":sh zellij run -n Yazi -c -f -x 10%% -y 10%% --width 80%% --height 80%% -- ~/.local/scripts/yazi-picker hsplit %{buffer_name}";

            };
          };
        };
        editor = {
          auto-format = true;
          # soft-wrap.enable = true;
          # soft-wrap.wrap-at-text-width = true;
          line-number = "relative";
          continue-comments = true;
          cursor-shape.insert = "bar";
          bufferline = "always";
          end-of-line-diagnostics = "hint";
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
            other-lines = "disable";
          };
          rainbow-brackets = true;
        };
      };
    };
  };
}
