
{config, ...}: {
  home.file.".config/gh" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/modules/terminal/apps/gh/homeManager/dotfiles";
  };
}
