{
  pkgs,
  config,
  ...
}: {
  home.file.".config/kanshi" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/home/jakob/common/features/kanshi/dotfiles";
    recursive = true;
  };
}
