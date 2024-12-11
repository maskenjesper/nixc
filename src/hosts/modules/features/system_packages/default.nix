{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    kicad

    killall
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

    nautilus

    gnome-disk-utility
    udisks

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
