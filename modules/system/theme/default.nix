{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.system-theme = {
    config,
    pkgs,
    lib,
    ...
  }: {
    imports = with self.nixosModules; [
      system-theme-bibataCursors
      system-theme-gtk
    ];

    xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };

  perSystem = {
    pkgs,
    ...
  }: {

  };
}
