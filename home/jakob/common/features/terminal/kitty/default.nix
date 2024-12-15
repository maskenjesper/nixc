{
  pkgs,
  config,
  ...
}: {
  home.file.".config/kitty" = {
    # for some reaseon this doesn't work: config.lib.file.mkOutOfStoreSymlink
    source = "${config.home.homeDirectory}/nixc/home/jakob/common/features/terminal/kitty/dotfiles";
    recursive = true;
  };

  programs.kitty.enable = true;
}
