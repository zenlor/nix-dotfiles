{
  programs.tmux = {
    enable = true;
    aggressiveResize = true;
    baseIndex = 1;
    clock24 = true;
    historyLimit = 5000;
    keyMode = "vi";
    prefix = "C-a";
    secureSocket = true;
    terminal = "screen-256color";
    customPaneNavigationAndResize = true;

    extraConfig = ''
      bind-key a last-window

      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set -s escape-time 0

      # mouse
      set -g mouse on
      setw -g alternate-screen on

      # pane splitting.
      bind v split-window -h -c "#{pane_current_path}"
      bind b split-window -v -c "#{pane_current_path}"

      # leader+S to sync panes
      bind S set synchronize-panes

      # UI
      set -g status-left-length 32
      set -g status-right-length 150

      set -g status-fg colour4
      set -g status-bg colour0

      set -g status-left '#[fg=colour10,bg=colour0,bold] ❐ #S #[fg=colour8,bg=colour10] #(whoami) #[fg=colour8,bg=colour10]░#[fg=colour10,bg=colour0]░'
      set -g window-status-format "#[bg=colour0]  #I #W "
      set -g window-status-current-format "#[fg=colour8,bg=colour16,bold]░ #I #W "
      set -g status-right "#[nobold]░▒ #(hostname -s) · #(date +'%m%d|%H%M')"
    '';
  };
}
