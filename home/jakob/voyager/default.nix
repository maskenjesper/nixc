{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../common/global
    ../common/features/terminal/nixCats
    ../common/features/git
    ../common/features/git/gh
    ../common/features/terminal/kitty
    ../common/features/terminal/lf
    ../common/features/terminal/zsh
    ../common/features/terminal/fish
    ../common/features/terminal/tmux
    ../common/features/hyprland
    ../common/features/rofi
    ../common/features/waybar
    ../common/features/desktop/common/wayland/wofi
  ];

  home.username = "jakob";
  home.homeDirectory = "/home/jakob";

  # For packages that need no configuration (yet...)
  home.packages = with pkgs; [
    # Trying out
    libreoffice
    vlc
    gimp
    shotcut
    audacity
    filezilla
    thunderbird
    keepassxc
    sublime

    # Studies
    anki-bin

    # CLI utilities
    htop
    killall
    playerctl
    neofetch
    lm_sensors
    hddtemp

    # GUI utilities
    resources
    nautilus
    usbimager
    galculator
    gnome-disk-utility
    udisks
    baobab
    pwvucontrol
    gucharmap

    # Messaging
    discord
    telegram-desktop

    # Browsers
    brave
    vivaldi
    qutebrowser

    # Music
    spotify

    # Notes
    obsidian

    # Drawing
    rnote
    krita
    sweethome3d.application
    kicad

    # Networking
    wireshark
    traceroute
    networkmanagerapplet

    # Productivity
    pomodoro-gtk
    blanket
  ];

  home.stateVersion = "24.05"; # Please read the comment before changing.

  programs.home-manager.enable = true;
}
