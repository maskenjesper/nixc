
{
  pkgs,
  config,
  ...
}: {
  home.file.".config/fish" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/src/users/modules/terminal/fish/dotfiles";
    recursive = true;
  };
}
