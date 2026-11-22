{
  flake.nixosModules.postgresql = {pkgs, ...}: {
    environment.systemPackages = [
    ];

    services.postgresql = {
      enable = true;
    };
  };
}
