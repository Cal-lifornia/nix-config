{ lib, ... }:
{
  programs.nixvim = {

    enable = true;

    colorschemes.catppuccin.enable = true;

    opts = {
      number = true;
      relativenumber = true;
    };
    keymaps = [
      {
        key = "C-S";
        actions = ":update";
        mode = "n";
      }
    ];
    extraConfigVim = builtins.readFile "./files/helix.vim";
  };
}
