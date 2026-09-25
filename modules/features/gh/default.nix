{
  flake.homeModules.gh = {
    config,
    pkgs,
    ...
  }: {
    home.file.".config/gh".source =
      if !config.dotfiles.mutable
      then ./dotfiles
      else config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/modules/features/gh/dotfiles";

    home.packages = [pkgs.gh];
  };
}
