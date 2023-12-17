{ config, lib, pkgs, ... }:
{
  programs.tmux =
    {
      enable = true;
      clock24 = true;
      baseIndex = 1;
      keyMode = "vi";
      mouse = true;
      prefix = "M-a";
      terminal = "tmux-256color";

      plugins = with pkgs.tmuxPlugins; [
        tmux-fzf
        {
          plugin = resurrect;
          extraConfig = "set -g @resurrect-strategy-nvim 'session'";
        }
        {
          plugin = continuum;
          extraConfig = ''
            set -g @resurrect-capture-pane-contents 'on'
            set -g @continuum-restore 'on'
            set -g @continuum-save-interval '60' # minutes
          '';
        }
        {
          plugin = catppuccin;
          extraConfig = ''
            set -g @catppuccin_flavour 'mocha'
            set -g @catppuccin_window_status_enable "yes"
            set -g @catppuccin_window_status_icon_enable "yes"
            set -g @catppuccin_status_fill "icon"
            set -g @catppuccin_window_default_fill "number"
            set -g @catppuccin_window_current_fill "number"
            set -g @catppuccin_window_default_text "#W"
            set -g @catppuccin_window_current_text "#W"
            set -g @catppuccin_status_connect_separator "yes"
            set -g @catppuccin_status_modules_right "host user date_time"
            set -g @catppuccin_status_modules_left "session directory"
          '';
        }
      ];

      extraConfig = ''
        set-option -g set-titles-string '#S: #W - TMUX'
      '';
    };
}
