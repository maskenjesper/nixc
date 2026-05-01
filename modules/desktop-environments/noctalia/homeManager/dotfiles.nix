{config, ...}: {
  home.file.".config/noctalia" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/neonixc/modules/desktop-environments/noctalia/homeManager/dotfiles";
    recursive = true;
  };
}
