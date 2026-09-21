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
      ({
        pkgs,
        modulesPath,
        ...
      }: {
        imports = [
          "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
        ];

        nixpkgs.hostPlatform = "x86_64-linux";

        nix.settings.experimental-features = [
          "nix-command"
          "flakes"
          "pipe-operators"
        ];

        environment.systemPackages = with pkgs; [
          nvim
          git
        ];
      })
    ];
  };
}
