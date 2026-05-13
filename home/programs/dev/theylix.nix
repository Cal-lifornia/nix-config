{ pkgs, ... }:
let
  bin_files = ./bin;
in
{
  home.packages = with pkgs; [
    tig
    serpl
    regex-tui
  ];
  home.file = {
    ".config/yazi/theylix/yazi.toml" = {
      enable = true;
      text = ''
        [opener]
        text = [
          { run = 'helix "$@"', block = true },
        ]
        preview = [
          { run = 'open "$@"'}
        ]
        helix = [
          { run = 'theylix -a "$@"', block = true, desc = "Use yazi as file picker within helix" },
        ]

        [mgr]
        sort_dir_first = true
        ratio = [2, 2, 5]
        sort_by = "natural"
        show_hidden = true

        [open]
        rules = [
          { name = "**/*", use = "helix" },
        ]
      '';
    };
    ".config/yazi/theylix/keymap.toml" = {
      enable = true;
      text = ''
        [mgr]
        prepend_keymap = [
        	{ on = "<C-h>", run = 'shell -- theylix -h "$@"', desc = "Open in Helix with horizontal split" },
        	{ on = "<C-v>", run = 'shell -- theylix -v "$@"', desc = "Open in Helix with vertical split" },
        ]
      '';
    };
    ".local/bin/txde" = {
      enable = true;
      executable = true;
      source = "${bin_files}/txde.sh";
    };
    ".local/bin/theylix" = {
      enable = true;
      executable = true;
      source = "${bin_files}/theylix.sh";
    };
  };
}
