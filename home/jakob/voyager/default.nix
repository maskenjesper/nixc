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
    # Studies
    anki-bin

    # CLI utilities
    htop
    killall
    playerctl
    neofetch

    # GUI utilities
    nautilus
    usbimager
    galculator
    gnome-disk-utility
    udisks
    baobab
    pwvucontrol
    _1password-gui
    gucharmap

    # Messaging
    discord
    telegram-desktop

    # Browsers
    brave
    vivaldi

    # Music
    spotify

    # Notes
    obsidian

    # Drawing
    rnote
    krita
    sweethome3d.application

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
