{
  description = "Flutter 3.13.x";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
  };
  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config = {
        android_sdk.accept_license = true;
        allowUnfree = true;
      };
    };
  in {
    devShells."${system}".default = with pkgs;
      mkShell {
        packages = [
          zsh

          gtk2
          gtk3
          gtk4

          clang
          cmake
          ninja
          pkg-config

          pcre
          libepoxy

          libuuid # for mount.pc
          xorg.libXdmcp.dev
          python310Packages.libselinux.dev # for libselinux.pc
          libsepol.dev
          libthai.dev
          libdatrie.dev
          libxkbcommon.dev
          dbus.dev
          at-spi2-core.dev
          xorg.libXtst.out
          pcre2.dev

          jdk11
          andorid-studio
          android-tools
        ];

        LD_LIBRARY_PATH = lib.makeLibraryPath [
          fontconfig.lib
          sqlite.out
        ];

        shellHook = ''
          exec zsh
        '';
      };
  };
}
