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

  flake.nixosModules.niri = {
    pkgs,
    lib,
    self',
    ...
  }: {
    programs.niri = {
      enable = true;
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
  };
}
