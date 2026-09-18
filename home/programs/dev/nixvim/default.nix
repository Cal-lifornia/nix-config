{ ... }:
{
  imports = [
    ./mini.nix
    ./keybinds.nix
    ./plugins.nix
    ./lsp.nix
  ];
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "macchiato";
      };
    };
    opts = {
      number = true;
      relativenumber = true;
    };
    keymaps = [
      {
        mode = "n";
        action = ":bn";
        key = "<S-Right>";
      }
      {
        mode = "n";
        action = ":bp";
        key = "<S-Left>";
      }
      {
        key = "<C-S>";
        action = ":w<CR>";
        mode = "n";
      }
    ];
  };
}
