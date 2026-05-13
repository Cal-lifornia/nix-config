{ ... }:
{
  programs.helix.languages = {
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
}
