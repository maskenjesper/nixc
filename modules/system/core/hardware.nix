{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.system-core-hardware = {
    pkgs,
    lib,
    config,
    ...
  }: let
    # TODO: maybe use this
    # hardware = config.lib.file.mkOutOfStoreSymlink /etc/nixos/hardware-configuration.nix;
  in {
    imports = [
      /etc/nixos/hardware-configuration.nix
    ];
    hardware = {
      bluetooth.enable = true;
      xpadneo.enable = true;
    };
  };
}
