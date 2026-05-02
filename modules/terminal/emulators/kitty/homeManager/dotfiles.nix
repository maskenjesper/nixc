{config, ...}: {
  home.file.".config/kitty" = {
    # for some reaseon this doesn't work: config.lib.file.mkOutOfStoreSymlink
    # source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/modules/terminal/emulators/kitty/dotfiles";
    source = ./dotfiles;
    recursive = true;
  };
}
