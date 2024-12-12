{
  pkgs,
  config,
  ...
}: {
  programs.neovim = {
    enable = true;
  };

  home.file.".config/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/src/users/modules/terminal/neovim/dotfiles";
    recursive = true;
  };
}
