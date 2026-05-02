{config, ...}: {
  home.file.".config/fish" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/neonixc/modules/terminal/shells/fish/homeManager/dotfiles";
    recursive = true;
  };
}
