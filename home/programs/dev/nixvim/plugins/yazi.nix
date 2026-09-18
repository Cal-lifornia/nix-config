{ ... }:
{
  plugins.yazi.enable = true;
  programs.nixvim.keymaps = [
    {
      key = "<C-y>y";
      mode = "n";
      action = "<cmd>Yazi<cr>";
      desc = "Open Yazi";
    }
  ];
}
