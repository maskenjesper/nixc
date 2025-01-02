{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../common/global
    ../common/users/jakob

    # import optional modules
    ../common/optional/desktop_environment/wallpaper
    ../common/optional/desktop_environment/window_manager/hyprland
    ../common/optional/stylix
    ../common/optional/docker
  ];

  networking.hostName = "voyager"; # Define your hostname.

  ####### define options values here ########
  global.xremap.users = ["jakob"];

  ###########################################

  environment.etc = {
    "1password/custom_allowed_browsers" = {
      text = ''
        vivaldi-bin
        zen-wrapped
      '';
      mode = "0755";
    };
  };

  environment.systemPackages = with pkgs; [
    #kicad

    nix-index
    vncdo

    libsForQt5.qt5ct

    # CLI tools
    ripgrep
    zoxide
    fzf

    # User applications
  ];

  system.stateVersion = "24.05";
}
