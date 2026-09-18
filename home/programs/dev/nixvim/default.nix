{ ... }:
{
  imports = [
    ./mini.nix
    ./keybinds.nix
    ./plugins.nix
  ];
  programs.nixvim = {
    enable = true;
    opts = {
      number = true;
      relativenumber = true;
    };
    globals = {
      mapleader = " ";
    };
    keymaps = [
      {
        key = "<C-S>";
        action = ":w<CR>";
        mode = "n";
      }
    ];
  };
}
