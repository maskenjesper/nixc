{
  flake.homeModules.niri = {config, ...}: {
    home.file.".config/niri".source =
      if !config.dotfiles.mutable
      then ./dotfiles
      else config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/modules/features/niri/dotfiles";
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

    # programs.waybar.enable = true;
    environment.systemPackages = with pkgs; [
      xwayland-satellite # xwayland support
      alacritty
    ];
  };
}
