{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.iso = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.iso-configuration
    ];
  };
}
