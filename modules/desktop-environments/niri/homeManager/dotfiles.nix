{config, ...}: {
  home.file.".config/niri" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/modules/desktop-environments/niri/homeManager/dotfiles";
    recursive = true;
  };
}
