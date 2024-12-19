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
    ../common/features/stylix
  ];

  home.username = "jakob";
  home.homeDirectory = "/home/jakob";

  # For packages that need no configuration (yet...)
  home.packages = with pkgs; [
    # Trying out
    libreoffice
    vlc
    shotcut
    audacity
    filezilla
    thunderbird
    keepassxc
    arduino-ide

    # Dev
    dbeaver-bin

    # Studies
    anki-bin
    mars-mips
    logisim-evolution

    # CLI utilities
    htop
    killall
    playerctl
    neofetch
    lm_sensors
    hddtemp

    # GUI utilities
    alarm-clock-applet
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
    vivaldi

    # Music
    spotify

    # Notes
    obsidian

    # Drawing
    rnote
    krita
    sweethome3d.application
    kicad
    gimp

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
