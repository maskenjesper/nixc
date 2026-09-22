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
      system-theme-catppuccinGtk
    ];

    xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
  };
}
