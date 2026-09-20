{inputs, ...}: {
  perSystem = {system, ...}: {
    _module.args.unfreePkgs = import inputs.nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
  };
  flake.nixosModules.system-core-nix_settings = {...}: {
    nix = {
      registry = {
      };
      settings = {
        cores = 6;
        trusted-users = ["root" "jakob"];
        download-buffer-size = 524288000;
        experimental-features = [
          "nix-command"
          "flakes"
          "pipe-operators"
        ];
      };
      nixPath = ["nixpkgs=${inputs.nixpkgs}"];
      optimise.automatic = true;
      gc = {
        automatic = true;
        dates = "daily";
        options = "--delete-older-than 5d";
      };
    };
    nixpkgs = {
      config = {
        allowUnfree = true;
        packageOverrides = pkgs: {
          unstable = import inputs.nixpkgs-unstable {
            config = {
              allowUnfree = true;
            };
          };
        };
      };
    };
  };
}
