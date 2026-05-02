

{config, ...}: {
  home.file.".config/lazygit" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/modules/terminal/apps/lazygit/homeManager/dotfiles";
  };
}
