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
    home.file.".config/quickshell".source =
      if !config.dotfiles.mutable
      then ./dotfiles
      else config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/modules/features/quickshell/dotfiles";
  };
}
