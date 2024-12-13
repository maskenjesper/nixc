{
  pkgs,
  config,
  ...
}: {
  programs.neovim = {
    enable = true;
  };

  home.file.".config/nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/src/hosts/voyager/users/home_manager_modules/terminal/neovim/dotfiles";
    recursive = true;
  };
}
