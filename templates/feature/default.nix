{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.XXXXX = {
    pkgs,
    lib,
    self',
    ...
  }: let
    modules = with self.nixosModules; [
    ];
  in {
    imports = modules;
  };

  perSystem = {
    pkgs,
    lib,
    self',
    ...
  }: {
    packages.XXXXX = inputs.wrapper-modules.wrappers.XXXXX.wrap {
      inherit pkgs;
    };
  };
}
