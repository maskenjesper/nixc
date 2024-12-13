{
  pkgs,
  config,
  ...
}: {
  home.file.".config/kitty" = {
    # for some reaseon this doesn't work: config.lib.file.mkOutOfStoreSymlink
    source = "${config.home.homeDirectory}/nixc/src/users/modules/terminal/kitty/dotfiles";
    recursive = true;
  };
}
