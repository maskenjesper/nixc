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
    nixvim = {
        url = "github:nix-community/nixvim";
        inputs.nixpkgs.follows = "nixpkgs";
    };
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
    host = "desktop";
    user = "jakob";
  in {
    nixosConfigurations = {
      ${host} = lib.nixosSystem {
        system = system;
        specialArgs = {
          inherit system;
          inherit inputs;
          inherit host;
          inherit user;
        };
        modules = [
          ./src/hosts/${host}
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
          inherit host;
          inherit user;
        };
        modules = [
          ./src/users/${user}
        ];
      };
    };
  };
}
