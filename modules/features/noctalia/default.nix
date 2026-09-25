{
  self,
  inputs,
  ...
}: {
  flake.homeModules.noctalia = {config, ...}: {
    home.file.".config/noctalia".source =
      if !config.dotfiles.mutable
      then ./dotfiles
      else config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/modules/features/noctalia/dotfiles";
  };

  flake.nixosModules.noctalia = {
    pkgs,
    lib,
    self',
    ...
  }: {
    imports = [
      inputs.noctalia.nixosModules.default
    ];

    programs.noctalia = {
      enable = true;

      recommendedServices.enable = true;

      # systemd.enable = true;
    };
  };
}
