{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    hyprpanel
    hyprpicker
    gucharmap
    # deps for sddm
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects

    # Manage dotfiles
    home-manager
    stow # manage dotfiles

    # Misc
    playerctl
    zoxide
    networkmanagerapplet
    gnumake
    lf
    gh # github cli
    neofetch

    # Terminal
    neovim
    tmux
    fzf
    kitty # hyprland default (needed with standard hyprland config
    zsh

    libnotify # mako dep
    rofi-wayland # app launcher

    # Clipboard management
    wl-clipboard
    cliphist

    # Dev
    elixir
    erlang

    # LSPs
    nixd # Nix
    lua-language-server # Lua

    # Code formatters
    alejandra # Nix
    stylua # Lua
    shellcheck # bash

    # User applications
    _1password-gui
    obsidian
    spotify
    discord
    brave
  ];
}
