{config, ...}: {
  home.file.".config/git" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/neonixc/modules/terminal/apps/git/homeManager/dotfiles";
  };
}
