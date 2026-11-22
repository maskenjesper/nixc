{
  flake.nixosModules.postgresql = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.dbeaver-bin
    ];

    services.postgresql = {
      enable = true;
    };
  };
}
