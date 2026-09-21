{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.saturn-configuration = {pkgs, ...}: {
    imports = with self.nixosModules; [
      niri
      noctalia
      system-core
      system-network
      nh
      amd-gpu
      gaming
      virtualization
      ssh

      inputs.nix-index-database.nixosModules.nix-index
    ];

    nh.enable = true;

    networking.hostName = "saturn"; # Define your hostname.

    environment.systemPackages = [
      pkgs.spotify
      pkgs.keepassxc
      pkgs.vivaldi
      pkgs.spotify

      # Just trying out installing a package from a flake.
      # The issue is the handling of system. I think there's
      # a better way.
      #inputs.nix-melt.packages."x86_64-linux".default
      # It's also available in nixpkgs:
      pkgs.nix-melt
      pkgs.opencode
    ];
  };
}
