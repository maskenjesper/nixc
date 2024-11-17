{
  pkgs,
  config,
  ...
}: {
  home.file.".config/rofi" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/src/users/modules/features/rofi/dotfiles";
    recursive = true;
  };
}
