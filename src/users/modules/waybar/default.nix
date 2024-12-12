{
  pkgs,
  config,
  ...
}: {
  home.file.".config/waybar" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/src/users/modules/waybar/dotfiles";
    recursive = true;
  };
}
