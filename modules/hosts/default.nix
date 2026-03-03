{inputs, ...}: {
  flake = {
    nixosConfigurations = {
      tellus = inputs.nixpkgs.lib.nixosSystem {
        modules = [../../profiles/tellus inputs.agenix.nixosModules.default];
        specialArgs = {
          inherit inputs;
          localUsers = ["jakob"];
        };
      };

      rpi = inputs.nixpkgs.lib.nixosSystem {
        modules = [../../profiles/rpi inputs.agenix.nixosModules.default];
        specialArgs = {
          inherit inputs;
          localUsers = ["jakob"];
        };
      };

      jupiter = inputs.nixpkgs.lib.nixosSystem {
        modules = [../../profiles/jupiter inputs.agenix.nixosModules.default];
        specialArgs = {
          inherit inputs;
          localUsers = ["jakob"];
        };
      };

      voyager = inputs.nixpkgs.lib.nixosSystem {
        modules = [../../profiles/voyager inputs.agenix.nixosModules.default];
        specialArgs = {
          inherit inputs;
          localUsers = ["jakob"];
        };
      };
    };
  };
}
