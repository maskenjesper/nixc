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
  }: let
    modules = with self.nixosModules; [
      bibataCursors
      catppuccinGtk
    ];
  in {
    imports = modules;
  };
}
