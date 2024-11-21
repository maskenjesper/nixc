{
  pkgs,
  config,
  ...
}: let
  tmux-super-fingers =
    pkgs.tmuxPlugins.mkTmuxPlugin
    {
      pluginName = "tmux-super-fingers";
      version = "unstable-2023-01-06";
      src = pkgs.fetchFromGitHub {
        owner = "artemave";
        repo = "tmux_super_fingers";
        rev = "2c12044984124e74e21a5a87d00f844083e4bdf7";
        sha256 = "sha256-cPZCV8xk9QpU49/7H8iGhQYK6JwWjviL29eWabuqruc=";
      };
    };
in {
  home.file.".scripts/tmux-sessionizer.sh" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/src/users/modules/features/terminal/tmux/tmux-sessionizer.sh";
  };

  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    historyLimit = 100000;
    plugins = with pkgs; [
      {
        plugin = tmux-super-fingers;
        extraConfig = "set -g @super-fingers-key f";
      }
      tmuxPlugins.better-mouse-mode
      {
        plugin = tmuxPlugins.gruvbox;
        extraConfig = ''
          set -g @tmux-gruvbox 'dark'
        '';
      }
      tmuxPlugins.vim-tmux-navigator
      # {
      #   plugin = tmuxPlugins.resurrect;
      #   extraConfig = ''
      #     set -g @resurrect-strategy-vim 'session'
      #     set -g @resurrect-strategy-nvim 'session'
      #     set -g @resurrect-capture-pane-contents 'on'
      #   '';
      # }
      # {
      #   plugin = tmuxPlugins.continuum;
      #   extraConfig = ''
      #     set -g @continuum-restore 'on'
      #     set -g @continuum-boot 'on'
      #     set -g @continuum-save-interval '10'
      #   '';
      # }
    ];
    extraConfig = ''
      set -sg escape-time 0

      set-option -sa terminal-overrides ",xterm*:Tc"
      set -g status-position top


      set -g mouse on

      # Shortcut source the config
      unbind r
      bind r source-file ~/.config/tmux/tmux.conf \; display-message "config re-sourced"

      # tmux prefix
      unbind C-b
      set -g prefix C-Space
      bind C-Space send-prefix

      # Start windows and panes at 1 , not 0
      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      # Shift Alt vim keys to switch windows
      bind -r h previous-window
      bind -r l next-window

      # Better window and pane management
      bind -r c new-window -c "#{pane_current_path}"
      bind -r "'" split-window -v -c "#{pane_current_path}"
      bind -r ';' split-window -h -c "#{pane_current_path}"
      bind k kill-window

      # Yanking rebinds
      set-window-option -g mode-keys vi
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      bind-key -T copy-mode-vi Escape send-keys -X cancel
    '';
  };
}