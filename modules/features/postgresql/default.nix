{
  flake.nixosModules.postgresql = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.beekeeper-studio
      pkgs.dbeaver-bin
    ];

    services.postgresql = {
      enable = true;
      ensureDatabases = ["mydatabase"];
      authentication = pkgs.lib.mkOverride 10 ''
        #type   database    DBuser  auto-method
        local   all         all     trust
      '';
    };
  };
}
