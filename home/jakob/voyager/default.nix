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
    ../common/features/terminal/wezterm
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
    cowsay
    gedit
    guvcview
    vlc
    shotcut
    audacity
    filezilla
    keepassxc
    minesweep-rs

    # Office
    masterpdfeditor
    libreoffice

    # Dev
    dbeaver-bin
    arduino-ide
    vscodium-fhs

    # Studies
    anki-bin
    mars-mips
    logisim-evolution

    # CLI utilities
    chatgpt-cli
    power-profiles-daemon
    lazygit
    zip
    unzip
    htop
    killall
    playerctl
    neofetch
    lm_sensors
    hddtemp
    wget
    curl

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
    thunderbird
    element-desktop
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
