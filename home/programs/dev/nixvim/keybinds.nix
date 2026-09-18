{ lib, ... }:
{
  # Helix-style keymaps for nixvim, originally translated from the
  # hand-authored keymaps in ./helix.vim (kept alongside this file for
  # historical reference only; it is no longer loaded via `extraConfigVim`).
  #
  # Scope: only the semantically distinct, hand-authored bindings are listed.
  # Omitted as auto-generated boilerplate (see the "compiled by
  # helix.vim/compile.sh" header of that file):
  #   - The default-vim-key-disabling <nop> block at the top of helix.vim.
  #   - The per-character Zf<c>/vf<c>, Zt<c>/vt<c>, ZF<c>/vF<c>, ZT<c>/vT<c>
  #     and r<c> tables, which repeat the same template for every printable
  #     character purely so f/t/F/T/r keep working while extend mode is
  #     active. Their behavior is already covered by the base f/F/t/T/r
  #     entries below.
  #   - The internal Z<motion> helper mappings (Zl, Zh, Zj, Zk, Ze, Zw, Zb,
  #     ZE, ZW, ZB, Zgl, Zgh, Zgs, Zge, Z<A-;>, Zmm, Zgf) and the visual-mode
  #     (xnoremap) / extend-mode (xmap vms<c>) duplicates of the match-mode
  #     `ms<c>` surround binds -- these are implementation plumbing for the
  #     user-facing binds listed here, not distinct binds themselves.
  programs.nixvim.keymaps = [
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "e";
      action = "e";
      options.desc = "Move to end of word (native)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "E";
      action = "E";
      options.desc = "Move to end of WORD (native)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "w";
      action = "w";
      options.desc = "Move to start of next word (native)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "W";
      action = "W";
      options.desc = "Move to start of next WORD (native)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "b";
      action = "b";
      options.desc = "Move to start of previous word (native)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "B";
      action = "B";
      options.desc = "Move to start of previous WORD (native)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "t<CR>";
      action = "<Esc>vg_";
      options.desc = "Select till last non-blank character of the line";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "t";
      action = "<Esc>vt";
      options.desc = "Select till character forward";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "T<CR>";
      action = "<Esc>v0";
      options.desc = "Select till start of the line";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "T";
      action = "<Esc>vT";
      options.desc = "Select till character backward";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "f<CR>";
      action = "<Esc>v$";
      options.desc = "Select to end of the line";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "f";
      action = "<Esc>vf";
      options.desc = "Select to character forward (inclusive)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "F<CR>";
      action = "<Esc>v0h$";
      options.desc = "Select whole line";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "F";
      action = "<Esc>vF";
      options.desc = "Select to character backward (inclusive)";
    }
    {
      mode = "x";
      key = "G";
      action = "Gvv";
      options.desc = "Go to line (default: last line), keep selecting";
    }
    {
      mode = "x";
      key = "<A-.>";
      action = "<Esc>v;";
      options.desc = "Repeat last find-motion, extend selection";
    }
    {
      mode = "x";
      key = "<Home>";
      action = "<Esc>0v";
      options.desc = "Go to start of line, keep selecting";
    }
    {
      mode = "x";
      key = "<End>";
      action = "<Esc>$v";
      options.desc = "Go to end of line, keep selecting";
    }
    {
      mode = "x";
      key = "<C-b>";
      action = "<Esc><C-b>v";
      options.desc = "Page up, keep selecting";
    }
    {
      mode = "x";
      key = "<PageDown>";
      action = "<Esc><C-b>v";
      options.desc = "Page up, keep selecting";
    }
    {
      mode = "x";
      key = "<C-f>";
      action = "<Esc><C-f>v";
      options.desc = "Page down, keep selecting";
    }
    {
      mode = "x";
      key = "<PageUp>";
      action = "<Esc><C-f>v";
      options.desc = "Page down, keep selecting";
    }
    {
      mode = "x";
      key = "<C-u>";
      action = "<Esc><C-u>v";
      options.desc = "Half-page up, keep selecting";
    }
    {
      mode = "x";
      key = "<C-d>";
      action = "<Esc><C-d>v";
      options.desc = "Half-page down, keep selecting";
    }
    {
      mode = "x";
      key = "<C-i>";
      action = "<Esc><C-i>v";
      options.desc = "Jump forward in jump list, keep selecting";
    }
    {
      mode = "x";
      key = "<C-o>";
      action = "<Esc><C-o>v";
      options.desc = "Jump backward in jump list, keep selecting";
    }
    {
      mode = "n";
      key = "j";
      action = "gj";
      options.desc = "Move down (display line)";
    }
    {
      mode = "n";
      key = "k";
      action = "gk";
      options.desc = "Move up (display line)";
    }

    ############################
    # Changes
    ############################
    {
      mode = "x";
      key = "R";
      action = "\"_d\"\"P`[v`]";
      options.desc = "Replace selection with unnamed register contents";
    }
    {
      mode = "n";
      key = "R";
      action = "\"_xP";
      options.desc = "Replace char under cursor with unnamed register contents";
    }
    {
      mode = "x";
      key = "~";
      action = "~gv";
      options.desc = "Toggle case of selection, keep selecting";
    }
    {
      mode = "x";
      key = "`";
      action = "ugv";
      options.desc = "Lowercase selection, keep selecting";
    }
    {
      mode = "n";
      key = "`";
      action = "gul";
      options.desc = "Lowercase character under cursor";
    }
    {
      mode = "x";
      key = "<A-`>";
      action = "Ugv";
      options.desc = "Uppercase selection, keep selecting";
    }
    {
      mode = "n";
      key = "<A-`>";
      action = "gUl";
      options.desc = "Uppercase character under cursor";
    }
    {
      mode = "x";
      key = "i";
      action = "<Esc>`<i";
      options.desc = "Insert before the start of the selection";
    }
    {
      mode = "x";
      key = "a";
      action = "<Esc>`>a";
      options.desc = "Insert after the end of the selection";
    }
    {
      mode = "x";
      key = "I";
      action = "<Esc>`<I";
      options.desc = "Insert at the start of the line (selection start)";
    }
    {
      mode = "x";
      key = "A";
      action = "<Esc>`>A";
      options.desc = "Insert at the end of the line (selection end)";
    }
    {
      mode = "x";
      key = "o";
      action = "<Esc>`>o <BS>";
      options.desc = "Open a new line below the selection";
    }
    {
      mode = "n";
      key = "o";
      action = "o <BS>";
      options.desc = "Open a new line below";
    }
    {
      mode = "x";
      key = "O";
      action = "<Esc>`<O <BS>";
      options.desc = "Open a new line above the selection";
    }
    {
      mode = "n";
      key = "O";
      action = "O <BS>";
      options.desc = "Open a new line above";
    }
    {
      mode = "x";
      key = ".";
      action = "<Esc>`<.";
      options.desc = "Repeat last change at the start of the selection";
    }
    {
      mode = "n";
      key = ".";
      action = ".";
      options.desc = "Repeat last change";
    }
    {
      mode = "x";
      key = "u";
      action = "<Esc>uv";
      options.desc = "Undo, keep selecting";
    }
    {
      mode = "x";
      key = "U";
      action = "<Esc><C-R>v";
      options.desc = "Redo, keep selecting";
    }
    {
      mode = "x";
      key = "y";
      action = "ygv";
      options.desc = "Yank selection, keep selecting";
    }
    {
      mode = "n";
      key = "y";
      action = "yl";
      options.desc = "Yank character under cursor";
    }
    {
      mode = "x";
      key = "p";
      action = "<Esc>`>pgv";
      options.desc = "Paste after the selection";
    }
    {
      mode = "x";
      key = "P";
      action = "<Esc>`<Pgv";
      options.desc = "Paste before the selection";
    }
    {
      mode = "x";
      key = "\"";
      action = "\"";
      options.desc = "Access a named register";
    }
    {
      mode = "x";
      key = ">";
      action = ">gv";
      options.desc = "Indent selection, keep selecting";
    }
    {
      mode = "n";
      key = ">";
      action = ">>";
      options.desc = "Indent line";
    }
    {
      mode = "x";
      key = "<";
      action = "<gv";
      options.desc = "Unindent selection, keep selecting";
    }
    {
      mode = "n";
      key = "<";
      action = "<<";
      options.desc = "Unindent line";
    }
    {
      mode = "x";
      key = "=";
      action = "=gv";
      options.desc = "Auto-indent selection, keep selecting";
    }
    {
      mode = "x";
      key = "d";
      action = "dv";
      options.desc = "Delete selection";
    }
    {
      mode = "n";
      key = "d";
      action = "x";
      options.desc = "Delete character under cursor";
    }
    {
      mode = "x";
      key = "<A-d>";
      action = "\"_dv";
      options.desc = "Delete selection without yanking";
    }
    {
      mode = "n";
      key = "<A-d>";
      action = "\"_x";
      options.desc = "Delete character under cursor without yanking";
    }
    {
      mode = "x";
      key = "c";
      action = "c";
      options.desc = "Change selection";
    }
    {
      mode = "n";
      key = "c";
      action = "s";
      options.desc = "Change character under cursor";
    }
    {
      mode = "x";
      key = "<A-c>";
      action = "\"_c";
      options.desc = "Change selection without yanking";
    }
    {
      mode = "x";
      key = "<C-a>";
      action = "<Esc><C-a>v";
      options.desc = "Increment number, keep selecting";
    }
    {
      mode = "x";
      key = "<C-x>";
      action = "<Esc><C-x>v";
      options.desc = "Decrement number, keep selecting";
    }
    {
      mode = "n";
      key = "U";
      action = "<C-R>";
      options.desc = "Redo";
    }

    ############################
    # Selection manipulation
    ############################
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "s";
      action = ":s/";
      options.desc = "Select regex matches within the selection (substitute)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "S";
      action = "<Esc>:echo \"Not supported in VIM\"<CR>gsgv";
      options.desc = "Split selection on regex matches (unsupported in this emulation)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "<A-s>";
      action = "<Esc>:echo \"Not supported in VIM\"<CR>gsgv";
      options.desc = "Split selection on regex matches, keep negated (unsupported)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "<A-_>";
      action = "<Esc>:echo \"Not supported in VIM\"<CR>gsgv";
      options.desc = "Split selection on newlines (unsupported)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "&";
      action = "<Esc>:echo \"Not supported in VIM\"<CR>gsgv";
      options.desc = "Keep only selections matching regex (unsupported)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "_";
      action = "<Esc>:echo \"Not implemented\"<CR>gsgv";
      options.desc = "Trim whitespace from selection (not implemented)";
    }
    {
      mode = "x";
      key = ";";
      action = "<Esc>";
      options.desc = "Collapse selection onto the cursor";
    }
    {
      mode = "x";
      key = "<A-;>";
      action = "o";
      options.desc = "Flip selection direction";
    }
    {
      mode = "x";
      key = "<A-:>";
      action = "<Esc>`<v`>";
      options.desc = "Ensure selection is facing forward";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = ",";
      action = "<Esc>:echo \"Not supported in VIM\"<CR>gsgv";
      options.desc = "Keep only the primary selection (unsupported)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "<A-,>";
      action = "<Esc>:echo \"Not supported in VIM\"<CR>gsgv";
      options.desc = "Remove the primary selection (unsupported)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "C";
      action = "<Esc>:echo \"Not implemented\"<CR>gsgv";
      options.desc = "Copy selection to the next line (not implemented)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "<A-C>";
      action = "<Esc>:echo \"Not implemented\"<CR>gsgv";
      options.desc = "Copy selection to the previous line (not implemented)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "(";
      action = "<Esc>:echo \"Not supported in VIM\"<CR>gsgv";
      options.desc = "Rotate main selection backward (unsupported)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = ")";
      action = "<Esc>:echo \"Not supported in VIM\"<CR>gsgv";
      options.desc = "Rotate main selection forward (unsupported)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "<A-(>";
      action = "<Esc>:echo \"Not supported in VIM\"<CR>gsgv";
      options.desc = "Rotate selection contents backward (unsupported)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "<A-)>";
      action = "<Esc>:echo \"Not supported in VIM\"<CR>gsgv";
      options.desc = "Rotate selection contents forward (unsupported)";
    }
    {
      mode = "x";
      key = "%";
      action = "<Esc>gg0vG$";
      options.desc = "Select entire file";
    }
    {
      mode = "n";
      key = "%";
      action = "gg0vG$";
      options.desc = "Select entire file";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "<A-x>";
      action = "<Esc>:echo \"Not implemented\"<CR>gsgv";
      options.desc = "Shrink selection to line bounds (not implemented)";
    }
    {
      mode = "x";
      key = "J";
      action = "Jgv";
      options.desc = "Join lines, keep selecting";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "<A-J>";
      action = "<Esc>:echo \"Not supported in VIM\"<CR>gsgv";
      options.desc = "Join lines without inserting a space (unsupported)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "K";
      action = "<Esc>:echo \"Not supported in VIM\"<CR>gsgv";
      options.desc = "Keep selections matching regex (unsupported)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "<A-K>";
      action = "<Esc>:echo \"Not supported in VIM\"<CR>gsgv";
      options.desc = "Remove selections matching regex (unsupported)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "<C-c>";
      action = "<Esc>:echo \"Not implemented\"<CR>gsgv";
      options.desc = "Toggle comments (not implemented)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "<A-o>";
      action = "<Esc>:echo \"Not implemented\"<CR>gsgv";
      options.desc = "Expand selection to parent syntax node (not implemented)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "<A-i>";
      action = "<Esc>:echo \"Not supported in VIM\"<CR>gsgv";
      options.desc = "Shrink syntax-tree selection (unsupported)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "<A-p>";
      action = "<Esc>:echo \"Not supported in VIM\"<CR>gsgv";
      options.desc = "Select previous sibling syntax node (unsupported)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "<A-n>";
      action = "<Esc>:echo \"Not supported in VIM\"<CR>gsgv";
      options.desc = "Select next sibling syntax node (unsupported)";
    }

    ############################
    # Search
    ############################
    {
      mode = "x";
      key = "/";
      action = "<Esc>/";
      options.desc = "Search forward";
    }
    {
      mode = "x";
      key = "?";
      action = "<Esc>?";
      options.desc = "Search backward";
    }
    {
      mode = "x";
      key = "n";
      action = "<Esc>gngnvgn";
      options.desc = "Go to next search match, extend selection";
    }
    {
      mode = "x";
      key = "N";
      action = "<Esc>gNgNvgN";
      options.desc = "Go to previous search match, extend selection";
    }
    {
      mode = "v";
      key = "*";
      action = "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>Ngv";
      options.desc = "Search for the selected text literally";
    }
    {
      mode = "n";
      key = "n";
      action = "gngnvgn";
      options.desc = "Go to next search match";
    }
    {
      mode = "n";
      key = "N";
      action = "gNgNvgN";
      options.desc = "Go to previous search match";
    }

    ############################
    # Goto mode ("g")
    #
    # Only the normal-mode form is listed; visual-mode (xnoremap) variants
    # exist in helix.vim that simply leave selection first (<Esc>) before
    # doing the same thing.
    ############################
    {
      mode = "n";
      key = "gg";
      action = "gg";
      options.desc = "Go to top of file (or given line)";
    }
    {
      mode = "n";
      key = "ge";
      action = "G";
      options.desc = "Go to end of file";
    }
    {
      mode = "n";
      key = "gf";
      action = "gf";
      options.desc = "Go to file under cursor";
    }
    {
      mode = "n";
      key = "gl";
      action = "$";
      options.desc = "Go to end of line";
    }
    {
      mode = "n";
      key = "gh";
      action = "0";
      options.desc = "Go to start of line";
    }
    {
      mode = "n";
      key = "gs";
      action = "^";
      options.desc = "Go to first non-blank character of line";
    }
    {
      mode = "n";
      key = "gt";
      action = "H";
      options.desc = "Go to top of screen";
    }
    {
      mode = "n";
      key = "gc";
      action = "M";
      options.desc = "Go to middle of screen";
    }
    {
      mode = "n";
      key = "gb";
      action = "L";
      options.desc = "Go to bottom of screen";
    }
    {
      mode = "n";
      key = "gd";
      action = "gD";
      options.desc = "Go to definition";
    }
    {
      mode = "n";
      key = "gy";
      action = ":echo \"Not implemented\"<CR>";
      options.desc = "Go to type definition (not implemented)";
    }
    {
      mode = "n";
      key = "gr";
      action = ":echo \"Not implemented\"<CR>";
      options.desc = "Go to references (not implemented)";
    }
    {
      mode = "n";
      key = "gi";
      action = ":echo \"Not implemented\"<CR>";
      options.desc = "Go to implementation (not implemented)";
    }
    {
      mode = "n";
      key = "ga";
      action = "<C-^>";
      options.desc = "Go to alternate (last accessed) file";
    }
    {
      mode = "n";
      key = "gm";
      action = ":echo \"Not implemented\"<CR>";
      options.desc = "Go to last modification (not implemented)";
    }
    {
      mode = "n";
      key = "gn";
      action = ":next<CR>";
      options.desc = "Go to next buffer/file";
    }
    {
      mode = "n";
      key = "gp";
      action = ":previous<CR>";
      options.desc = "Go to previous buffer/file";
    }
    {
      mode = "n";
      key = "g.";
      action = "`^";
      options.desc = "Go to last buffer edit/insert position";
    }
    {
      mode = "n";
      key = "gj";
      action = "j";
      options.desc = "Go down one line (linewise, not display line)";
    }
    {
      mode = "n";
      key = "gk";
      action = "k";
      options.desc = "Go up one line (linewise, not display line)";
    }

    ############################
    # Match mode ("m")
    #
    # Only the normal-mode surround-add (ms<char>) binds are listed; the
    # matching xnoremap and extend-mode (vms<char>) variants in helix.vim
    # apply the same surround character to the current selection instead of
    # inserting a fresh pair.
    ############################
    {
      mode = "n";
      key = "mm";
      action = "%";
      options.desc = "Jump to matching bracket/pair";
    }
    {
      mode = "x";
      key = "mm";
      action = "<Esc>%v";
      options.desc = "Jump to matching bracket/pair, keep selecting";
    }
    {
      mode = "n";
      key = "mr";
      action = "<Esc>:echo \"Not implemented\"<CR>gsgv";
      options.desc = "Replace surrounding pair (not implemented)";
    }
    {
      mode = "n";
      key = "md";
      action = "<Esc>:echo \"Not implemented\"<CR>gsgv";
      options.desc = "Delete surrounding pair (not implemented)";
    }
    {
      mode = "n";
      key = "ms(";
      action = "i(<Esc>la)<Esc>hhvll";
      options.desc = "Surround with ( )";
    }
    {
      mode = "n";
      key = "ms)";
      action = "i(<Esc>la)<Esc>hhvll";
      options.desc = "Surround with ( )";
    }
    {
      mode = "n";
      key = "ms[";
      action = "i[<Esc>la]<Esc>hhvll";
      options.desc = "Surround with [ ]";
    }
    {
      mode = "n";
      key = "ms]";
      action = "i[<Esc>la]<Esc>hhvll";
      options.desc = "Surround with [ ]";
    }
    {
      mode = "n";
      key = "ms{";
      action = "i{<Esc>la}<Esc>hhvll";
      options.desc = "Surround with { }";
    }
    {
      mode = "n";
      key = "ms}";
      action = "i{<Esc>la}<Esc>hhvll";
      options.desc = "Surround with { }";
    }
    {
      mode = "n";
      key = "ms<";
      action = "i<<Esc>la><Esc>hhvll";
      options.desc = "Surround with < >";
    }
    {
      mode = "n";
      key = "ms>";
      action = "i<<Esc>la><Esc>hhvll";
      options.desc = "Surround with < >";
    }
    {
      mode = "n";
      key = "ms'";
      action = "i'<Esc>la'<Esc>hhvll";
      options.desc = "Surround with ' '";
    }
    {
      mode = "n";
      key = "ms\"";
      action = "i\"<Esc>la\"<Esc>hhvll";
      options.desc = "Surround with \" \"";
    }
    {
      mode = "n";
      key = "ms`";
      action = "i`<Esc>la`<Esc>hhvll";
      options.desc = "Surround with ` `";
    }
    {
      mode = "n";
      key = "ms~";
      action = "i~<Esc>la~<Esc>hhvll";
      options.desc = "Surround with ~ ~";
    }
    {
      mode = "n";
      key = "ms/";
      action = "i/<Esc>la/<Esc>hhvll";
      options.desc = "Surround with / /";
    }
    {
      mode = "n";
      key = "ms_";
      action = "i_<Esc>la_<Esc>hhvll";
      options.desc = "Surround with _ _";
    }
    {
      mode = "n";
      key = "ms-";
      action = "i-<Esc>la-<Esc>hhvll";
      options.desc = "Surround with - -";
    }
    {
      mode = "n";
      key = "ms*";
      action = "i*<Esc>la*<Esc>hhvll";
      options.desc = "Surround with * *";
    }
    {
      mode = "n";
      key = "ms:";
      action = "i:<Esc>la:<Esc>hhvll";
      options.desc = "Surround with : :";
    }
    {
      mode = "n";
      key = "ms=";
      action = "i=<Esc>la=<Esc>hhvll";
      options.desc = "Surround with = =";
    }
    {
      mode = "n";
      key = "ms<Bar>";
      action = "i<Bar><Esc>la<Bar><Esc>hhvll";
      options.desc = "Surround with | |";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "maw";
      action = "<Esc>vaw";
      options.desc = "Select around word";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "maW";
      action = "<Esc>vaW";
      options.desc = "Select around WORD";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "map";
      action = "<Esc>vap";
      options.desc = "Select around paragraph";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "ma(";
      action = "<Esc>va(";
      options.desc = "Select around ( )";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "ma{";
      action = "<Esc>va{";
      options.desc = "Select around { }";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "ma<";
      action = "<Esc>va<";
      options.desc = "Select around < >";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "ma[";
      action = "<Esc>va[";
      options.desc = "Select around [ ]";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "ma'";
      action = "<Esc>va'";
      options.desc = "Select around ' '";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "ma\"";
      action = "<Esc>va\"";
      options.desc = "Select around \" \"";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "ma`";
      action = "<Esc>va`";
      options.desc = "Select around ` `";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "ma~";
      action = "<Esc>va~";
      options.desc = "Select around ~ ~";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "mat";
      action = "<Esc>:echo \"Not implemented\"<CR>gsgv";
      options.desc = "Select around surrounding tag (not implemented)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "maf";
      action = "<Esc>:echo \"Not implemented\"<CR>gsgv";
      options.desc = "Select around function (not implemented)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "maa";
      action = "<Esc>:echo \"Not implemented\"<CR>gsgv";
      options.desc = "Select around argument/parameter (not implemented)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "mac";
      action = "<Esc>:echo \"Not implemented\"<CR>gsgv";
      options.desc = "Select around comment (not implemented)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "maT";
      action = "<Esc>:echo \"Not implemented\"<CR>gsgv";
      options.desc = "Select around test (not implemented)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "mam";
      action = "<Esc>:echo \"Not implemented\"<CR>gsgv";
      options.desc = "Select around closest surrounding pair (not implemented)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "miw";
      action = "<Esc>viw";
      options.desc = "Select inside word";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "miW";
      action = "<Esc>viW";
      options.desc = "Select inside WORD";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "mip";
      action = "<Esc>vip";
      options.desc = "Select inside paragraph";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "mi(";
      action = "<Esc>vi(";
      options.desc = "Select inside ( )";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "mi{";
      action = "<Esc>vi{";
      options.desc = "Select inside { }";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "mi<";
      action = "<Esc>vi<";
      options.desc = "Select inside < >";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "mi[";
      action = "<Esc>vi[";
      options.desc = "Select inside [ ]";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "mi'";
      action = "<Esc>vi'";
      options.desc = "Select inside ' '";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "mi\"";
      action = "<Esc>vi\"";
      options.desc = "Select inside \" \"";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "mi`";
      action = "<Esc>vi`";
      options.desc = "Select inside ` `";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "mi~";
      action = "<Esc>vi~";
      options.desc = "Select inside ~ ~";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "mit";
      action = "<Esc>:echo \"Not implemented\"<CR>gsgv";
      options.desc = "Select inside surrounding tag (not implemented)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "mif";
      action = "<Esc>:echo \"Not implemented\"<CR>gsgv";
      options.desc = "Select inside function (not implemented)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "mia";
      action = "<Esc>:echo \"Not implemented\"<CR>gsgv";
      options.desc = "Select inside argument/parameter (not implemented)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "mic";
      action = "<Esc>:echo \"Not implemented\"<CR>gsgv";
      options.desc = "Select inside comment (not implemented)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "miT";
      action = "<Esc>:echo \"Not implemented\"<CR>gsgv";
      options.desc = "Select inside test (not implemented)";
    }
    {
      mode = "x";
      key = "mim";
      action = "<Esc>`>f)mb`>]`v%";
      options.desc = "Jump to the nearest closing pair and select to its match";
    }
    {
      mode = "n";
      key = "mim";
      action = "v<Esc>`>f)mb`>]`v%";
      options.desc = "Jump to the nearest closing pair and select to its match";
    }

    ############################
    # Window mode
    ############################
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "<Space>w";
      action = "<C-w>";
      options.desc = "Window mode prefix (delegates to Vim's <C-w>)";
    }

    ############################
    # Space mode (clipboard)
    ############################
    {
      mode = "x";
      key = "<Space>p";
      action = "<Esc>\"*p";
      options.desc = "Paste from system clipboard after selection";
    }
    {
      mode = "x";
      key = "<Space>P";
      action = "<Esc>\"*P";
      options.desc = "Paste from system clipboard before selection";
    }
    {
      mode = "x";
      key = "<Space>y";
      action = "\"*yg";
      options.desc = "Yank selection to system clipboard";
    }
    {
      mode = "x";
      key = "<Space>Y";
      action = "\"*yg";
      options.desc = "Yank selection to system clipboard";
    }
    {
      mode = "x";
      key = "<Space>R";
      action = "\"*p";
      options.desc = "Replace selection with system clipboard contents";
    }
    {
      mode = "n";
      key = "<Space>p";
      action = "\"*p";
      options.desc = "Paste from system clipboard";
    }
    {
      mode = "n";
      key = "<Space>P";
      action = "\"*P";
      options.desc = "Paste from system clipboard (before cursor)";
    }
    {
      mode = "n";
      key = "<Space>y";
      action = "\"*yl";
      options.desc = "Yank character under cursor to system clipboard";
    }
    {
      mode = "n";
      key = "<Space>Y";
      action = "\"*yl";
      options.desc = "Yank character under cursor to system clipboard";
    }
    {
      mode = "n";
      key = "<Space>R";
      action = "\"_x\"*P";
      options.desc = "Replace character under cursor with system clipboard contents";
    }

    ############################
    # Unimpaired / bracket mode
    ############################
    {
      mode = "x";
      key = "]p";
      action = "<Esc>v}";
      options.desc = "Extend selection to next paragraph";
    }
    {
      mode = "x";
      key = "[p";
      action = "<Esc>v{";
      options.desc = "Extend selection to previous paragraph";
    }
    {
      mode = "n";
      key = "]p";
      action = "v}";
      options.desc = "Select to next paragraph";
    }
    {
      mode = "n";
      key = "[p";
      action = "v{";
      options.desc = "Select to previous paragraph";
    }
    {
      mode = "x";
      key = "]<Space>";
      action = "o<Esc>gv";
      options.desc = "Add a blank line below";
    }
    {
      mode = "n";
      key = "]<Space>";
      action = "vvo<Esc>gv";
      options.desc = "Add a blank line below";
    }
    {
      mode = "x";
      key = "[<Space>";
      action = "O<Esc>gv";
      options.desc = "Add a blank line above";
    }
    {
      mode = "n";
      key = "[<Space>";
      action = "vvO<Esc>gv";
      options.desc = "Add a blank line above";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "]d";
      action = "<Esc>:cnext<CR>";
      options.desc = "Go to next quickfix entry (diagnostic)";
    }
    {
      mode = [
        "n"
        "v"
        "o"
      ];
      key = "[d";
      action = "<Esc>:cprevious<CR>";
      options.desc = "Go to previous quickfix entry (diagnostic)";
    }

    ############################
    # Select / extend mode toggle
    ############################
    # {
    #   mode = "n";
    #   key = "v";
    #   action = "vv";
    #   options.desc = "Enter extend (select) mode";
    #   options.remap = true;
    # }
    {
      mode = "n";
      key = "ZV";
      action = "V";
      options.desc = "Extend to whole line (base for line-select combos below)";
    }
    {
      mode = "n";
      key = "x";
      action = "ZVv";
      options.desc = "Select current line";
      options.remap = true;
    }
    {
      mode = "x";
      key = "x";
      action = "ZVv";
      options.desc = "Select current line";
      options.remap = true;
    }
    {
      mode = "n";
      key = "X";
      action = "0V";
      options.desc = "Select current line from start";
    }
    {
      mode = "x";
      key = "X";
      action = "0V";
      options.desc = "Select current line from start";
    }

    ############################
    # Extend mode: directional movement (press "v" then a movement key while
    # already in Vim's visual mode). These recurse into the internal
    # Z<motion> helper mappings defined in helix.vim to move one step further
    # while remaining in visual mode.
    ############################
    {
      mode = "x";
      key = "vl";
      action = "Zlv";
      options.desc = "Extend selection right";
      options.remap = true;
    }
    {
      mode = "x";
      key = "vh";
      action = "Zhv";
      options.desc = "Extend selection left";
      options.remap = true;
    }
    {
      mode = "x";
      key = "vj";
      action = "Zjv";
      options.desc = "Extend selection down (display line)";
      options.remap = true;
    }
    {
      mode = "x";
      key = "vk";
      action = "Zkv";
      options.desc = "Extend selection up (display line)";
      options.remap = true;
    }
    {
      mode = "x";
      key = "ve";
      action = "Zev";
      options.desc = "Extend selection to end of word";
      options.remap = true;
    }
    {
      mode = "x";
      key = "vw";
      action = "Zwv";
      options.desc = "Extend selection to start of next word";
      options.remap = true;
    }
    {
      mode = "x";
      key = "vb";
      action = "Zbv";
      options.desc = "Extend selection to start of previous word";
      options.remap = true;
    }
    {
      mode = "x";
      key = "vE";
      action = "ZEv";
      options.desc = "Extend selection to end of WORD";
      options.remap = true;
    }
    {
      mode = "x";
      key = "vW";
      action = "ZWv";
      options.desc = "Extend selection to start of next WORD";
      options.remap = true;
    }
    {
      mode = "x";
      key = "vB";
      action = "ZBv";
      options.desc = "Extend selection to start of previous WORD";
      options.remap = true;
    }
    {
      mode = "x";
      key = "vgl";
      action = "Zglv";
      options.desc = "Extend selection to end of line";
      options.remap = true;
    }
    {
      mode = "x";
      key = "vgh";
      action = "Zghv";
      options.desc = "Extend selection to start of line";
      options.remap = true;
    }
    {
      mode = "x";
      key = "vgs";
      action = "Zgsv";
      options.desc = "Extend selection to first non-blank character";
      options.remap = true;
    }
    {
      mode = "x";
      key = "vge";
      action = "Zgev";
      options.desc = "Extend selection to end of file";
      options.remap = true;
    }
    {
      mode = "x";
      key = "v<A-;>";
      action = "Z<A-;>v";
      options.desc = "Extend selection, flip direction";
      options.remap = true;
    }
    {
      mode = "x";
      key = "vmm";
      action = "Zmmv";
      options.desc = "Extend selection to matching bracket/pair";
      options.remap = true;
    }
    {
      mode = "x";
      key = "vgf";
      action = "Zgf";
      options.desc = "Go to file under cursor (extend-mode alias)";
      options.remap = true;
    }

    ############################
    # Extend mode: operations (press "v" then an operation key while already
    # in Vim's visual mode).
    ############################
    {
      mode = "x";
      key = "vc";
      action = "c";
      options.desc = "Change selection (extend-mode alias)";
      options.remap = true;
    }
    {
      mode = "x";
      key = "vr";
      action = "r";
      options.desc = "Replace selection with a character (extend-mode alias)";
      options.remap = true;
    }
    {
      mode = "x";
      key = "vR";
      action = "R";
      options.desc = "Replace selection with unnamed register (extend-mode alias)";
      options.remap = true;
    }
    {
      mode = "x";
      key = "vy";
      action = "y";
      options.desc = "Yank selection (extend-mode alias)";
      options.remap = true;
    }
    {
      mode = "x";
      key = "vo";
      action = "o";
      options.desc = "Open line below (extend-mode alias)";
      options.remap = true;
    }
    {
      mode = "x";
      key = "vO";
      action = "O";
      options.desc = "Open line above (extend-mode alias)";
      options.remap = true;
    }
    {
      mode = "x";
      key = "vp";
      action = "p";
      options.desc = "Paste after selection (extend-mode alias)";
      options.remap = true;
    }
    {
      mode = "x";
      key = "vP";
      action = "P";
      options.desc = "Paste before selection (extend-mode alias)";
      options.remap = true;
    }
    {
      mode = "x";
      key = "va";
      action = "a";
      options.desc = "Insert after selection (extend-mode alias)";
      options.remap = true;
    }
    {
      mode = "x";
      key = "vA";
      action = "A";
      options.desc = "Insert at end of line (extend-mode alias)";
      options.remap = true;
    }
    {
      mode = "x";
      key = "vd";
      action = "d";
      options.desc = "Delete selection (extend-mode alias)";
      options.remap = true;
    }
    {
      mode = "x";
      key = "v<A-d>";
      action = "<A-d>";
      options.desc = "Delete selection without yanking (extend-mode alias)";
      options.remap = true;
    }
    {
      mode = "x";
      key = "v>";
      action = ">";
      options.desc = "Indent selection (extend-mode alias)";
      options.remap = true;
    }
    {
      mode = "x";
      key = "v<";
      action = "<";
      options.desc = "Unindent selection (extend-mode alias)";
      options.remap = true;
    }
    {
      mode = "x";
      key = "vX";
      action = "X";
      options.desc = "Select current line from start (extend-mode alias)";
      options.remap = true;
    }
    {
      mode = "x";
      key = "vx";
      action = "Zjv";
      options.desc = "Extend selection down a line (extend-mode alias)";
      options.remap = true;
    }
    {
      mode = "x";
      key = "v<Space>y";
      action = "<Space>y";
      options.desc = "Yank selection to system clipboard (extend-mode alias)";
      options.remap = true;
    }
    {
      mode = "x";
      key = "v<Space>Y";
      action = "<Space>Y";
      options.desc = "Yank selection to system clipboard (extend-mode alias)";
      options.remap = true;
    }
    {
      mode = "x";
      key = "v<Space>R";
      action = "<Space>R";
      options.desc = "Replace selection with system clipboard (extend-mode alias)";
      options.remap = true;
    }
  ];
}
