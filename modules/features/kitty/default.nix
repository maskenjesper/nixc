{
  flake.homeModules.kitty = {
    config,
    pkgs,
    ...
  }: {
    home.file.".config/kitty".source =
      if !config.dotfiles.mutable
      then ./dotfiles
      else config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/modules/features/kitty/dotfiles";

    home.packages = [pkgs.kitty];
  };
}
