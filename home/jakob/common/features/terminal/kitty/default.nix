{
  pkgs,
  config,
  outputs,
  ...
}: {
  home.file.".config/kitty" = {
    # for some reaseon this doesn't work: config.lib.file.mkOutOfStoreSymlink
    source = ./dotfiles;
    recursive = true;
  };

  programs.kitty.enable = true;
}
