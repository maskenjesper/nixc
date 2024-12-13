{
  pkgs,
  config,
  ...
}: {
  home.file.".config/kitty" = {
    # for some reaseon this doesn't work: config.lib.file.mkOutOfStoreSymlink
    source = "${config.home.homeDirectory}/nixc/src/hosts/voyager/users/home_manager_modules/terminal/kitty/dotfiles";
    recursive = true;
  };
}
