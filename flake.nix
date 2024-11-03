{

	description = "My first flake!";

	inputs = {
		nixpkgs.url = "nixpkgs/nixos-unstable";
	};

	outputs = { self, nixpkgs, ...}: 
	let
		lib = nixpkgs.lib;
	in
	{
		nixosConfigurations = {
			desktop-nixos = lib.nixosSystem {
				system = "x84_64-linux";
				modules = [
					./configuration.nix
				];
			};
		};
	};

}
