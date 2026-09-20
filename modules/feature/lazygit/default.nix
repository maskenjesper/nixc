{
  flake.homeModules.lazygit = {config, ...}: {
    home.file.".config/lazygit" = {
      source = ./dotfiles;
      # source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/modules/terminal/apps/lazygit/homeManager/dotfiles";
      recursive = true;
    };
  };
}
