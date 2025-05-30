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
    ../common/wallpaper.nix
    ../common/desktop_environment/display_manager/sddm
#    ./features/hyprland.nix
    ./features/gaming.nix
    ./features/stylix
  ];

  networking.hostName = "tellus"; # Define your hostname.

  ####### define options values here ########
  global.xremap.users = ["jakob"];
  ###########################################

services = {
  desktopManager.plasma6.enable = true;

  displayManager.sddm.enable = true;

  displayManager.sddm.wayland.enable = true;
};

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
# KDE
    kdePackages.discover # Optional: Install if you use Flatpak or fwupd firmware update sevice
    kdePackages.kcalc # Calculator
    kdePackages.kcharselect # Tool to select and copy special characters from all installed fonts
    kdePackages.kcolorchooser # A small utility to select a color
    kdePackages.kolourpaint # Easy-to-use paint program
    kdePackages.ksystemlog # KDE SystemLog Application
    kdePackages.sddm-kcm # Configuration module for SDDM
    kdiff3 # Compares and merges 2 or 3 files or directories
    kdePackages.isoimagewriter # Optional: Program to write hybrid ISO files onto USB disks
    kdePackages.partitionmanager # Optional Manage the disk devices, partitions and file systems on your computer
    hardinfo2 # System information and benchmarks for Linux systems
    haruna # Open source video player built with Qt/QML and libmpv
    wayland-utils # Wayland utilities
    wl-clipboard # Command-line copy/paste utilities for Wayland


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
