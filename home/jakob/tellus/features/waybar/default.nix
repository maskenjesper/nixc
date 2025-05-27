{
  pkgs,
  config,
  ...
}: {
  home.file.".config/waybar" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/home/jakob/common/features/waybar/dotfiles";
    recursive = true;
  };
}
