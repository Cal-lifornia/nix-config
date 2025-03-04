let
  scriptsDir = ./scripts;
in
{ pkgs, ... }:
{
  home.file.".local/scripts/tmux-sessioniser" = {
    source = "${scriptsDir}/tmux-sessioniser";
    executable = true;
  };
  catppuccin = {
    tmux = {
      enable = true;
      flavor = "frappe";
      extraConfig = ''
        #set -g @catppuccin_status_modules_right "application session user host date_time"
        set -g @catppuccin_window_status_style "rounded"


        # Make the status line pretty and add some modules
        set -g status-right-length 100
        set -g status-left-length 100
        set -g status-left ""
        set -g status-right "#{E:@catppuccin_status_application}"
        set -agF status-right "#{E:@catppuccin_status_cpu}"
        set -ag status-right "#{E:@catppuccin_status_session}"
        set -ag status-right "#{E:@catppuccin_status_uptime}"
        set -agF status-right "#{E:@catppuccin_status_battery}"
      '';
    };
  };
  programs = {
    tmux = {
      enable = true;
      escapeTime = 0;
      baseIndex = 1;
      plugins = with pkgs.tmuxPlugins; [
        vim-tmux-navigator
        better-mouse-mode
        yank
        {
          plugin = resurrect;
          extraConfig = ''
            set -g @resurrect-capture-pane-contents 'on'
          '';
        }
        #{
        #  plugin = catppuccin;
        #  extraConfig = ''
        #    set -g @catppuccin_flavour 'frappe'
        # set -g @catppuccin_window_left_separator ""
        # set -g @catppuccin_window_right_separator " "
        #   set -g @catppuccin_window_middle_separator " █"
        #   set -g @catppuccin_window_number_position "right"
        #
        #   set -g @catppuccin_window_default_fill "number"
        #   set -g @catppuccin_window_default_text "#W"
        #
        #   set -g @catppuccin_window_current_fill "number"
        #   set -g @catppuccin_window_current_text "#W"
        #
        #   set -g @catppuccin_status_modules_right "directory user host session"
        #   set -g @catppuccin_status_left_separator  " "
        #   set -g @catppuccin_status_right_separator ""
        #   set -g @catppuccin_status_fill "icon"
        #   set -g @catppuccin_status_connect_separator "no"
        #
        #   set -g @catppuccin_directory_text "#{pane_current_path}"
        # '';
        # }
        tmux-fzf
        extrakto
      ];

      sensibleOnTop = false;
      extraConfig = ''
        set -g default-command "/usr/bin/env zsh"
        set -g default-terminal "xterm-256color"
        set -ga terminal-overrides ",*256col*:Tc"
        set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
        set-option -sa terminal-overrides ",xterm*:Tc"
        set-environment -g COLORTERM "truecolor"
        set -g prefix C-a
        unbind C-b
        bind-key C-a send-prefix
        bind-key -r f run-shell "tmux neww ~/.local/scripts/tmux-sessioniser"
        unbind %
        bind | split-window -h

        unbind '"'
        bind - split-window -v

        unbind r
        bind r source-file ~/.config/tmux/tmux.conf

        bind -r j resize-pane -D 5
        bind -r k resize-pane -U 5
        bind -r l resize-pane -R 5
        bind -r h resize-pane -L 5

        bind -r m resize-pane -Z

        set -g mouse on

        set-window-option -g mode-keys vi
        bind-key -T copy-mode-vi 'v' send -X begin-selection
        bind-key -T copy-mode-vi 'y' send -X copy-selection

        unbind -T copy-mode-vi MouseDragEnd1Pane
      '';
    };
  };
}
