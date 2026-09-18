{ lib, ... }:
{
  programs.nixvim.plugins = {
    mini = {
      enable = true;
      mockDevIcons = true;
      modules = {
        icons = { };
        snippets = {
          snippets = [
            { __raw = "require('mini.snippets').gen_loader.from_lang()"; }
          ];
        };
        completion = { };
        clue = {
          window = {
            delay = 200;
            config = {
              width = "auto";
            };
          };
          clues = [
            { __raw = "require('mini.clue').gen_clues.square_brackets()"; }
            { __raw = "require('mini.clue').gen_clues.builtin_completion()"; }
            { __raw = "require('mini.clue').gen_clues.g()"; }
            { __raw = "require('mini.clue').gen_clues.marks()"; }
            { __raw = "require('mini.clue').gen_clues.registers()"; }
            { __raw = "require('mini.clue').gen_clues.windows()"; }
            { __raw = "require('mini.clue').gen_clues.z()"; }
          ];
          triggers = [
            {
              mode = "n";
              keys = "<Leader>";
            }
            {
              mode = "v";
              keys = "<Leader>";
            }
            {
              mode = "n";
              keys = "<LocalLeader>";
            }
            {
              mode = "n";
              keys = "s";
            }
            {
              mode = "v";
              keys = "s";
            }
            {
              mode = "n";
              keys = "<C-w>";
            }
            {
              mode = "n";
              keys = "[";
            }
            {
              mode = "n";
              keys = "]";
            }
            {
              mode = "n";
              keys = "g";
            }
            {
              mode = "n";
              keys = "z";
            }
            {
              mode = "n";
              keys = "'";
            }
          ];
        };
      };
    };
  };
}
