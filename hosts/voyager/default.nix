{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../common/global
    ../common/users/jakob

    # import optional modules
    ../common/optional/desktop_environment/wallpaper
    ../common/optional/desktop_environment/window_manager/hyprland
  ];

  networking.hostName = "voyager"; # Define your hostname.

  ####### define options values here ########
  global.xremap.users = ["jakob"];

  ###########################################

  environment.systemPackages = with pkgs; [
    #kicad

    killall
    usbimager

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

    libsForQt5.qt5ct

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

  system.stateVersion = "24.05";
}
