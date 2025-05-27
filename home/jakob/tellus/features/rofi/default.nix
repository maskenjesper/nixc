{
  pkgs,
  config,
  ...
}: {
  home.file.".config/rofi" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/home/jakob/tellus/features/rofi/dotfiles";
    recursive = true;
  };
}
