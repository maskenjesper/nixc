{
  flake.homeModules.just = {
    pkgs,
    config,
    ...
  }: {
    home.file.".config/just".source =
      if !config.dotfiles.mutable
      then ./dotfiles
      else config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/modules/features/just/dotfiles";

    home.packages = with pkgs; [
      just
    ];
  };
}
