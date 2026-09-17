{ lib, ... }:
{
  imports = [ ./mini.nix ];
  programs.nixvim = {
    enable = true;

    opts = {
      number = true;
      relativenumber = true;
    };
    keymaps = [
      {
        key = "<C-S>";
        action = ":w<CR>";
        mode = "n";
      }
    ];
    extraConfigVim = builtins.readFile ./helix.vim;
  };
}
