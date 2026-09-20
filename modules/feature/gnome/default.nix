{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.gnome = {
    pkgs,
    lib,
    self',
    ...
  }: let
    modules = with self.nixosModules; [
    ];
  in {
    imports = modules;

    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    services.gnome.core-apps.enable = false;
    services.gnome.core-developer-tools.enable = false;
    services.gnome.games.enable = false;
    environment.gnome.excludePackages = with pkgs; [gnome-tour gnome-user-docs];
  };
}
