{
  pkgs,
  config,
  ...
}: {
  home.file.".config/rofi" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/src/hosts/voyager/users/home_manager_modules/rofi/dotfiles";
    recursive = true;
  };
}
