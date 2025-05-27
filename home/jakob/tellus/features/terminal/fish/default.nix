{
  pkgs,
  config,
  ...
}: {
  home.file.".config/fish" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/home/jakob/common/features/terminal/fish/dotfiles";
    recursive = true;
  };

  programs = {
    tmux.enable = true;
    zoxide.enable = true;
    fzf.enable = true;
  };
}
