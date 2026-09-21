{
  inputs,
  ...
}: {
  flake.homeModules.gittype = {pkgs, ...}: {
    home.packages = [
      inputs.gittype.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}