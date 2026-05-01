

{config, ...}: {
  home.file.".config/lazygit" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/neonixc/modules/terminal/apps/lazygit/homeManager/dotfiles";
  };
}
