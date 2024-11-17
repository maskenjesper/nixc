{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nautilus

    ripgrep

    #fonts
    font-awesome
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
  ];
}
