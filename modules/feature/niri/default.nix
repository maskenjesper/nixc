{
  self,
  inputs,
  moduleWithSystem,
  ...
}: {
  flake.homeModules.niri = {config, ...}: {
    home.file.".config/niri" = {
      source = ./dotfiles;
      recursive = true;
    };
  };

  flake.nixosModules.niri = moduleWithSystem ({
    pkgs,
    lib,
    self',
    ...
  }: let
    modules = with self.nixosModules; [
      noctalia
    ];
  in {
    imports = modules;

    programs.niri = {
      enable = true;
      package = self'.packages.niri;
    };

    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    security.polkit.enable = true; # polkit
    services.gnome.gnome-keyring.enable = true; # secret service
    security.pam.services.swaylock = {};

    # Enable inter-application communication
    xdg.portal.enable = true;
    xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

    # programs.waybar.enable = true;
    environment.systemPackages = with pkgs; [
      xwayland-satellite # xwayland support
      alacritty
    ];
  });

  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: {
    packages.niri = inputs.wrapper-modules.wrappers.niri.wrap {
      inherit pkgs;
      "config.kdl".path = ./dotfiles;
    };
  };
}
