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
        };
        modules = [
          ./hosts/${host}
          {nixpkgs.overlays = [inputs.hyprpanel.overlay];}
          inputs.stylix.nixosModules.stylix
        ];
      };
    };
    homeConfigurations = {
      ${user} = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            inputs.hyprpanel.overlay
          ];
        };
        extraSpecialArgs = {
          inherit inputs;
        };
        modules = [
          ./users/${user}
        ];
      };
    };
  };
}
