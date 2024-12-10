{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    usbimager

    zed-editor

    bash-language-server # temp

    # Gnome stuff
    pomodoro-gtk
    blanket

    nix-index
    vncdo

    wireshark
    traceroute

    pwvucontrol

    rnote
    krita

    just

    baobab # gnome only?

    lyx

    libsForQt5.qt5ct

    filezilla
    lazygit

    krusader
    nnn
    thunderbird
    ranger
    nautilus

    gnome-disk-utility
    udisks

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
