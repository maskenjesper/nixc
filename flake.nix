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
    ...
  } @ inputs: let
    inherit (self) outputs;
    lib = inputs.nixpkgs.lib;
    system = "x86_64-linux";
    pkgs = inputs.nixpkgs.legacyPackages.${system};
    user = "jakob";
  in {
    nixosConfigurations = {
      # Personal Laptop
      voyager = lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./src/hosts/voyager];
      };

      # Home desktop
      bettan = lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        modules = [./src/hosts/bettan];
      };
    };
    homeConfigurations = {
      "jakob@voyager" = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs user;};
        modules = [./src/hosts/voyager/users/jakob ./tasks];
      };
      "jakob@bettan" = inputs.home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = {inherit inputs user;};
        modules = [./src/hosts/bettan/users/jakob ./tasks];
      };
    };
  };
}
