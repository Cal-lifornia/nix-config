{ ... }:
{
  plugins.yazi.enable = true;
  keymaps = [
    {
      key = "<C-y>y";
      mode = "n";
      action = "<cmd>Yazi<cr>";
      options = {
        desc = "Open Yazi";
      };
    }
  ];
}
