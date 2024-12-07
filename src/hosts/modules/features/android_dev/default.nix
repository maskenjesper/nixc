{
  inputs,
  system,
  ...
}: let
  pkgs = import inputs.nixpkgs {
    inherit system;
    config = {
      android_sdk.accept_license = true;
      allowUnfree = true;
    };
  };
in {
  environment.systemPackages = with pkgs; [
    android-studio
  ];
}
