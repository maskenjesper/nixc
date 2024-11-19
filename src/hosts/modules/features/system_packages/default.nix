{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    lazygit

    krusader
    nnn
    thunderbird
    ranger
    nautilus

    # Terminal
    neovim
    tmux
    kitty # hyprland default (needed with standard hyprland config
    zsh

    # CLI tools
    ripgrep
    zoxide
    fzf

    # Misc
    playerctl
    networkmanagerapplet
    lf
    gh # github cli
    neofetch

    # User applications
  ];
}
