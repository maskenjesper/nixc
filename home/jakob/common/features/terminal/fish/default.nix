
{
  pkgs,
  config,
  ...
}: {
  home.file.".config/fish" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/home/jakob/common/features/terminal/fish/dotfiles";
    recursive = true;
  };
}
