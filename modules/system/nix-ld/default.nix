{moduleWithSystem, ...}: {
  flake.nixosModules.nix-ld = moduleWithSystem ({pkgs, ...}: {
    programs = {
      nix-ld = {
        enable = true;
        libraries = [
          pkgs.util-linux
          pkgs.stdenv.cc.cc
          pkgs.zlib
          pkgs.libusb1

          # stdenv.cc.cc.lib
          # libz
        ];
      };
    };
  });
}
