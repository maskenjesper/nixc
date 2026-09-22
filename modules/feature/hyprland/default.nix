{
  inputs,
  self,
  pkgs,
  lib,
  config,
  ...
}: {
  flake.nixosModules.hyprland = {
    pkgs,
    lib,
    config,
    ...
  }: let
    pkgs-unstable = inputs.hyprland.inputs.nixpkgs.legacyPackages.${pkgs.stdenv.hostPlatform.system};
  in {
    imports = [
      self.nixosModules.quickshell
      self.nixosModules.stylix
      self.nixosModules.printing
      self.nixosModules.bluetooth
      self.nixosModules.disks
      inputs.hyprland.nixosModules.default
    ];

    options = {
      hyprland.enabled = lib.mkOption {type = lib.types.bool;};
    };

    config = {
      programs.hyprland = {
        enable = true;
        xwayland.enable = true;
        withUWSM = true;
        package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
        portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
        # plugins = [
        #   inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.hyprscrolling
        # ];
      };

      hardware.graphics = {
        package = pkgs-unstable.mesa;
        enable32Bit = true;
        package32 = pkgs-unstable.pkgsi686Linux.mesa;
      };

      environment.sessionVariables = {
        wlr_no_hardware_cursors = "1";
        nixos_ozone_wl = "1";
      };

      services.xserver.enable = true;

      xdg.portal.enable = true;
    };
  };

  flake.homeModules.hyprland = {pkgs, config, ...}: {
    imports = [
      self.homeModules.waybar
      self.homeModules.quickshell
      self.homeModules.wofi
      self.homeModules.stylix
    ];

    home.file.".config/hypr" = {
      source = ./dotfiles;
      recursive = true;
    };

    # Explicitly avoids conficts with uswm
    wayland.windowManager.hyprland = {
      systemd.enable = false;
      enable = false;
    };

    home.packages = with pkgs; [
      networkmanagerapplet
      gucharmap
      alarm-clock-applet
      resources
      usbimager
      galculator

      hyprshot
      qt5.qtquickcontrols2
      qt5.qtgraphicaleffects
      waypaper
      swww
      swaybg
      # Notifications
      swaynotificationcenter
      libnotify # notification dep

      # Locking
      hyprlock

      hyprsunset
      hyprpolkitagent
      hyprpicker
      hypridle

      # Panel and widgets
      waybar

      # App launcher
      rofi

      # Clipboard management
      wl-clipboard
      cliphist

      #####################
      # Disk usage analyzer
      baobab

      # Disks utitlity
      gnome-disk-utility
      udisks
      udisks2
      udiskie

      # Camera utility
      guvcview
    ];
  };
}