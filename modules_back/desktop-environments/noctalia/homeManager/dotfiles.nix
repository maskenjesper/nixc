{config, ...}: {
  home.file.".config/noctalia" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/modules/desktop-environments/noctalia/homeManager/dotfiles";
    recursive = true;
  };
}
