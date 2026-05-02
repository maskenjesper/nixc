{
  pkgs,
  config,
  ...
}: {

  home.file.".config/waybar" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/modules/desktop-environments/common/waybar/homeManager/dotfiles";
    recursive = true;
  };
}
