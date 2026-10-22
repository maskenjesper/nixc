return {
	settings = {
		nixd = {
			nixpkgs = {
				expr = "import (builtins.getFlake (builtins.toString ./.)).inputs.nixpkgs { }",
			},
			formatting = {
				command = { "alejandra" },
			},
		},
	},
}
