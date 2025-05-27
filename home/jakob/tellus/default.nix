{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../common/global
    ./features/terminal/nixCats
    ./features/git
    ./features/git/gh
    ./features/terminal/kitty
    ./features/terminal/lf
    ./features/terminal/zsh
    ./features/terminal/fish
    ./features/terminal/tmux
    ./features/hyprland
    ./features/rofi
    ./features/waybar
    ./features/desktop/common/wayland/wofi
    ./features/stylix
    ./features/kanshi
  ];

  home.username = "jakob";
  home.homeDirectory = "/home/jakob";

  programs = {
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };

  # For packages that need no configuration (yet...)
  home.packages = with pkgs; [
    # Trying out

    # Media
    vlc
    shotcut
    audacity
    rnote
    krita
    sweethome3d.application
    kicad
    gimp

    # Office
    masterpdfeditor
    morgen
    tetex
    evince
    libreoffice

    # Dev
    gigalixir
    postman
    dbeaver-bin
    arduino-ide
    vscodium-fhs

    # Studies
    exercism
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
    cowsay
    guvcview
    kanshi
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
    filezilla
    keepassxc

    # Messaging
    thunderbird
    element-desktop
    discord
    halloy
    telegram-desktop

    # Browsers
    vivaldi
    inputs.zen-browser.packages.x86_64-linux.default

    # Music
    spotify

    # Notes
    obsidian

    # Networking
    traceroute
    networkmanagerapplet

    # Productivity
    pomodoro-gtk
    blanket
  ];

  home.stateVersion = "24.05"; # Please read the comment before changing.

  programs.home-manager.enable = true;
}
