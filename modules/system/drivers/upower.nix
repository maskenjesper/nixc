{...}: {
  flake.nixosModules.upower = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.upower
    ];
    services = {
      upower.enable = true;
      power-profiles-daemon.enable = true;
    };
  };
}
