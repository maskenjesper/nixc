{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.iso = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      localUsers = ["jakob"];
    };
    modules = [
      self.nixosModules.iso-configuration
    ];
  };
}
