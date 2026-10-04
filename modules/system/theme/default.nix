{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.theme = {
    config,
    pkgs,
    lib,
    ...
  }: {
    imports = [
      self.nixosModules.bibataCursors
      self.nixosModules.gtk
    ];

    xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  perSystem = {pkgs, ...}: {
  };
}
