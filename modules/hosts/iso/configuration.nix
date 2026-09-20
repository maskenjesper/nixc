{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.iso-configuration = {
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
  };
}
