{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.noctalia = {
    pkgs,
    lib,
    self',
    ...
  }: {
    imports = [
      inputs.noctalia.nixosModules.default
    ];

    programs.noctalia = {
      enable = true;

      recommendedServices.enable = true;

      systemd.enable = true;

      # package = self'.packages.noctalia-shell;
    };
  };

  perSystem = {pkgs, ...}: {
    packages.noctalia-shell = inputs.wrapper-modules.wrappers.noctalia-shell.wrap {
      inherit pkgs;
    };
  };
}
