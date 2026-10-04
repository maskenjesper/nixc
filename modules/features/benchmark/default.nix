{
  flake.nixosModules.benchmark = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.geekbench_6
      pkgs.phoronix-test-suite
      pkgs.stress-ng
    ];
  };
}
