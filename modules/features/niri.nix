{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.niri = {
    pkgs,
    self',
    lib,
    ...
  }: {
    programs.niri = {
      enable = true;
      package = self'.packages.myNiri;
    };
  };

  perSystem = {
    pkgs,
    lib,
    ...
  }: {
    packages.myNiri = inputs.wrapper-modules.wrappers.niri.wrap {
      settings = {
      };
    };
  };
}
