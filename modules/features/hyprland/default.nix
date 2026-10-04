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

  flake.homeModules.hyprland = {
    pkgs,
    config,
    ...
  }: {
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

    home.packages = [
      pkgs.networkmanagerapplet
      pkgs.gucharmap
      pkgs.alarm-clock-applet
      pkgs.resources
      pkgs.usbimager
      pkgs.galculator

      pkgs.hyprshot
      pkgs.qt5.qtquickcontrols2
      pkgs.qt5.qtgraphicaleffects
      pkgs.waypaper
      pkgs.swww
      pkgs.swaybg
      # Notifications
      pkgs.swaynotificationcenter
      pkgs.libnotify # notification dep

      # Locking
      pkgs.hyprlock

      pkgs.hyprsunset
      pkgs.hyprpolkitagent
      pkgs.hyprpicker
      pkgs.hypridle

      # Panel and widgets
      pkgs.waybar

      # App launcher
      pkgs.rofi

      # Clipboard management
      pkgs.wl-clipboard
      pkgs.cliphist

      #####################
      # Disk usage analyzer
      pkgs.baobab

      # Disks utitlity
      pkgs.gnome-disk-utility
      pkgs.udisks
      pkgs.udisks2
      pkgs.udiskie

      # Camera utility
      pkgs.guvcview
    ];
  };
}
