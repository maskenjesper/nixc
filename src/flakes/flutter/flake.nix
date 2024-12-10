{
  description = "Flutter 3.13.x";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        config = {
          android_sdk.accept_license = true;
          allowUnfree = true;
        };
      };
      # buildToolsVersion = "34.0.0";
      # androidComposition = pkgs.androidenv.composeAndroidPackages {
      #   buildToolsVersions = [buildToolsVersion "28.0.3"];
      #   platformVersions = ["34" "28"];
      #   abiVersions = ["armeabi-v7a" "arm64-v8a"];
      # };
      # androidSdk = androidComposition.androidsdk;
      androidSdk = pkgs.androidenv.androidPkgs.androidsdk;
    in {
      devShell = pkgs.mkShell {
        # this is an env var
        ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk";
        buildInputs = with pkgs; [
          flutter
          androidSdk # The customized SDK that we've made above
          jdk17
        ];
      };
    });
}
