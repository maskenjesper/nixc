{
  flake.nixosModules.dolphin = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.kdePackages.dolphin
      pkgs.kdePackages.qtsvg
      pkgs.kdePackages.kio-fuse
      pkgs.kdePackages.kio-extras
    ];
  };
}
