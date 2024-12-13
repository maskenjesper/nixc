
{
  pkgs,
  config,
  ...
}: {
  home.file.".config/fish" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/src/hosts/voyager/users/home_manager_modules/terminal/fish/dotfiles";
    recursive = true;
  };
}
