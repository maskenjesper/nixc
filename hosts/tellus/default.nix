{
  pkgs, 
  inputs,
  lib,
  ...
}: { 
  imports = [
    ./hardware-configuration.nix 
    ../common/global 
    ../common/users/jakob

    # import optional modules
    ./features/wallpaper.nix
    ./features/hyprland.nix
    ./features/gaming.nix
    ./features/stylix
  ];

  networking.hostName = "tellus"; # Define your hostname.

  ####### define options values here ########
  global.xremap.users = ["jakob"];
  ###########################################

  swapDevices = lib.mkForce [ ];

  environment.etc = {
    "1password/custom_allowed_browsers" = {
      text = ''
        vivaldi-bin
        zen-wrapped
      '';
      mode = "0755";
    };
  };
  programs.adb.enable = true;
  users.users.jakob.extraGroups = ["adbusers"];
  boot.kernelModules = ["v4l2loopback"];
  services.hardware.bolt.enable = true;

  environment.systemPackages = with pkgs; [
    #kicad

    devenv

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
