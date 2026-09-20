{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.saturn = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      self.nixosModules.saturnConfiguration
    ];
  };
}
