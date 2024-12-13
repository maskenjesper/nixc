{
  pkgs,
  config,
  ...
}: {
  home.file.".config/waybar" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/src/hosts/voyager/users/home_manager_modules/waybar/dotfiles";
    recursive = true;
  };
}
