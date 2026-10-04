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
  }: {
    imports = [];
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
