{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    lazygit

    krusader
    nnn
    thunderbird
    ranger
    nautilus

    # Terminal
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
    gh # github cli
    neofetch

    # User applications
  ];
}
