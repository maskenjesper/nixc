{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.saturn-configuration = {pkgs, ...}: {
    imports = [
      self.nixosModules.system-core
      self.nixosModules.system-network
      self.nixosModules.gnome
      self.nixosModules.kitty
      inputs.nix-index-database.nixosModules.nix-index
      self.nixosModules.nh
    ];

    nh.enable = true;

    networking.hostName = "saturn"; # Define your hostname.

    environment.systemPackages = [
      pkgs.spotify
      pkgs.keepassxc

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
