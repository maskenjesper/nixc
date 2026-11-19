{
  flake.nixosModules.hamachi = {pkgs, ...}: {
    services.logmein-hamachi.enable = true;
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = [
      pkgs.haguichi
    ];
  };
}
