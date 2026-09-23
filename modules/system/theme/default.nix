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
    imports = with self.nixosModules; [
      bibataCursors
      gtk
    ];

    xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  perSystem = {pkgs, ...}: {
  };
}
