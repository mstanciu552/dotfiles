{ config, lib, pkgs, ... }:
let 
# TODO fix - this does not work
dotfiles = pkgs.fetchgit {
  url = "https://github.com/mstanciu552/dotfiles.git";
  rev = "main";
# sha256 = "0dcy7bv2bdg36dpa6x3saaakgijrw9k0j19nik7b8m7avh1ayxiq";
  sha256 = "0v740zq57v6d0azcs51n0d6pyrk4f7hkqf2f28118ljs04ax5q1k";
};
mod = "Mod4";
in
{

# Set user home directory
  home.username = "sc0p3";
  home.homeDirectory = "/home/sc0p3";

# Put everything from dotfiles into ~/.config
# home.file.".config".source = dotfiles;

# Home user - needed packages
  home.packages = with pkgs; [
    i3
    i3status
    i3blocks
    rofi
    git
    zsh
    tmux
    kitty
    eza
  ];

# basic configuration for using git
  programs.git = {
    enable = true;
    userName = "Mihai Stanciu";
    userEmail = "mstanciu552@gmail.com";
  };

# basic bash configuration
  programs.bash = {
    enable = true;
    enableCompletion = true;
# custom bashrc
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin"
      '';

# shell aliases
    shellAliases = {
      ll = "eza -al";
    };
  };

# basic zsh configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

# use oh-my-zsh as the plugin manager
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
      ];
      theme = "robbyrussell";
    };
    shellAliases = {
      ll = "eza -al";
    };
  };

# basic kitty configuration
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      enable_audio_bell = false;
      mouse_hide_wait = "-1.0";
      window_padding_width = 10;
      background_opacity = "0.5";
      background_blur = 5;
      symbol_map = let
        mappings = [
        "U+23FB-U+23FE"
          "U+2B58"
          "U+E200-U+E2A9"
          "U+E0A0-U+E0A3"
          "U+E0B0-U+E0BF"
          "U+E0C0-U+E0C8"
          "U+E0CC-U+E0CF"
          "U+E0D0-U+E0D2"
          "U+E0D4"
          "U+E700-U+E7C5"
          "U+F000-U+F2E0"
          "U+2665"
          "U+26A1"
          "U+F400-U+F4A8"
          "U+F67C"
          "U+E000-U+E00A"
          "U+F300-U+F313"
          "U+E5FA-U+E62B"
        ];
      in
        (builtins.concatStringsSep "," mappings) + " Symbols Nerd Font"; 
    };
  };

  # Configure i3
  xsession.windowManager.i3 = {
    enable = true;
    package = pkgs.i3-gaps;
    config = {
      modifier = mod;
      gaps = {
        inner = 10;
        outer = 2;
      };

      keybindings = lib.mkOptionDefault {
        "${mod}+Return" = "exec kitty";
        "${mod} + c" = "kill";
        "${mod} + b" = "exec brave";
        # "${mod} + r" = "rofi -show drun";
      };

      bars = [
      {
        position = "top";
      }
      ];
    };
  };

  # Configure tmux
  programs.tmux = {
    enable = true;
    shell = "${pkgs.zsh}/bin/zsh";

    plugins = with pkgs; [
      tmuxPlugins.better-mouse-mode
      tmuxPlugins.yank
      tmuxPlugins.resurrect
    ];

    extraConfig = ''
      # Terminal settings
      set-window-option -g mode-keys vi
      set-option -g default-terminal tmux-256color
      set-option -sg escape-time 10
      set-option -sa terminal-overrides ',alacritty:RGB'
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q' # this is for the cursor shape

      # Statusline settings
      set-option -g status-right '#(whoami)'
      # set-option -g status-bg colour45
      # set-option -g status-fg black
      set-option -g status on
      set-option -g status-interval 1
      set-option -g status-justify centre
      set-option -g status-keys vi
      set-option -g status-position bottom
      set-option -g status-style fg=colour136,bg=colour235
      set-option -g status-left-length 20
      set-option -g status-left-style default
      set-option -g status-left "#[fg=blue]#H #[fg=black]• #[fg=blue]#(uname -r)#[default]"
      set-option -g status-right-length 140
      set-option -g status-right-style default
      set-option -g status-right "#[fg=blue,bg=default,bright]#(tmux-mem-cpu-load) "
      set-option -ag status-right "#[fg=red,dim,bg=default]#(uptime | cut -f 4-5 -d ' ' | cut -f 1 -d ',') "
      set-option -ag status-right " #[fg=white,bg=default]%a%l:%M:%S %p#[default] #[fg=blue]%Y-%m-%d"
      set-window-option -g window-status-style fg=colour244
      set-window-option -g window-status-style bg=default
      set-window-option -g window-status-current-style fg=colour166
      set-window-option -g window-status-current-style bg=default

      setw -g window-status-current-style fg=blue,bg=default

      # Send prefix
      set-option -g prefix C-a
      unbind-key C-a
      bind-key C-a send-prefix

      # Use ALT+ARROWS to switch panes
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      # Shift arrow to switch windows
      bind -n S-Left previous-window
      bind -n S-Right next-window

      # Mouse mode
      setw -g mouse on

      # Easier window split keys
      bind-key v split-window -h
      bind-key h split-window -v

      # Easy config reload
      bind-key r source-file ~/.tmux.conf \; display-message "~/.tmux.conf reloaded"
    '';
  };

# set channel version for home-manager
  home.stateVersion = "24.11";

# allow home-manager to self-manage
  programs.home-manager.enable = true;
}
