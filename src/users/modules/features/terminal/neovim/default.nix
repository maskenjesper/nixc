{
  pkgs,
  config,
  ...
}: {
  home.file.".config/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/src/users/modules/features/terminal/neovim/dotfiles";
    recursive = true;
  };
}
