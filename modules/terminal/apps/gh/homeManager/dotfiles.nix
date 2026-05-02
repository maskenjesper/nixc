
{config, ...}: {
  home.file.".config/gh" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/neonixc/modules/terminal/apps/gh/homeManager/dotfiles";
  };
}
