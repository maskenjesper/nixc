{pkgs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ../common/global
    ../common/users/jakob

    # import optional modules
    ../common/optional/desktop_environment/wallpaper
    ../common/optional/desktop_environment/window_manager/hyprland
    ../common/optional/stylix
  ];

  networking.hostName = "voyager"; # Define your hostname.

  ####### define options values here ########
  global.xremap.users = ["jakob"];

  ###########################################

  environment.systemPackages = with pkgs; [
    #kicad

    nix-index
    vncdo

    libsForQt5.qt5ct

    lazygit

    # CLI tools
    ripgrep
    zoxide
    fzf


    # User applications
  ];

  system.stateVersion = "24.05";
}
