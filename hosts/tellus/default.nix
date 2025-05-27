{pkgs, ...}: 
{ imports = [
    ./hardware-configuration.nix ../common/global ../common/users/jakob

    # import optional modules
    ../common/optional/desktop_environment/window_manager/hyprland
  ];

  networking.hostName = "tellus"; # Define your hostname.

  ####### define options values here ########
  global.xremap.users = ["jakob"];
  ###########################################

  environment.systemPackages = with pkgs; [
    #kicad

neovim
    killall usbimager

    #zed-editor

    #bash-language-server # temp

    # Gnome stuff
#    pomodoro-gtk
    #blanket

    kitty
    git

    nix-index vncdo

    #wireshark traceroute

    #pwvucontrol

    #rnote krita

    just

    baobab # gnome only?

    #lyx

    libsForQt5.qt5ct

    #filezilla
    lazygit

    nautilus

    gnome-disk-utility udisks

    # CLI tools
    ripgrep zoxide fzf

    # Misc
    playerctl networkmanagerapplet neofetch

    # User applications
  ];

  # This value determines the NixOS release from which the default settings for stateful data, like file locations and database versions on your system 
  # were taken. It‘s perfectly fine and recommended to leave this value at the release version of the first install of this system. Before changing this 
  # value read the documentation for this option (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
