{
  description = "Flutter 3.13.x";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };
  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
  in {
    devShells."${system}".default = let
      pkgs = import nixpkgs {
        inherit system;
        config = {
          android_sdk.accept_license = true;
          allowUnfree = true;
        };
      };
    in
      pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
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


          # jdk11
          # android-studio
          # android-tools

          flutter
          # androidsdk
          jdk
        ];

        shellHook = ''
          exec zsh
        '';
      };
  };
}
