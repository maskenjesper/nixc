{
  pkgs,
  config,
  ...
}: {
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  home.file.".config/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/src/users/modules/features/terminal/neovim/dotfiles";
    recursive = true;
  };
}
