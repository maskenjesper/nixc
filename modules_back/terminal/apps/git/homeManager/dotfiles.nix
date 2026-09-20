{config, ...}: {
  home.file.".config/git" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/modules/terminal/apps/git/homeManager/dotfiles";
  };
}
