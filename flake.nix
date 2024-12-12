{
  description = "My first flake!";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    xremap-flake.url = "github:xremap/nix-flake";
    ags.url = "github:Aylur/ags";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";
    stylix.url = "github:danth/stylix";
    nixCats.url = "github:BirdeeHub/nixCats-nvim";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    user = "jakob";
  in {
    nixosConfigurations = {
      desktop = lib.nixosSystem {
        system = system;
        specialArgs = {
          inherit system;
          inherit inputs;
          host = "desktop";
          inherit user;
        };
        modules = [
          ./src/hosts/desktop
          {nixpkgs.overlays = [inputs.hyprpanel.overlay];}
          inputs.stylix.nixosModules.stylix
        ];
      };

      exampleIso = lib.nixosSystem {
        specialArgs = {inherit inputs;};
        modules = [
          ./src/hosts/isoimage
        ];
      };
      
      laptop = lib.nixosSystem {
	      system = system;
		specialArgs = {
		  inherit system;
		  inherit inputs;
		  host = "laptop";
		  inherit user;
		};
		modules = [
		  ./src/hosts/laptop
		  {nixpkgs.overlays = [inputs.hyprpanel.overlay];}
		  inputs.stylix.nixosModules.stylix
		];
	};
    };
    homeConfigurations = {
      ${user} = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
        };
        extraSpecialArgs = {
          inherit inputs;
          host = "laptop";
          inherit user;
        };
        modules = [
          ./src/users/${user}
          ./tasks
        ];
      };
    };
  };
}
