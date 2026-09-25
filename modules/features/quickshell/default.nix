{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.quickshell = {pkgs, ...}: {
    imports = [
      self.nixosModules.greetd
    ];

    environment.systemPackages = [
      inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };

  flake.homeModules.quickshell = {config, ...}: {
    home.file.".config/quickshell" = {
      source = ./dotfiles;
      recursive = true;
    };
  };
}