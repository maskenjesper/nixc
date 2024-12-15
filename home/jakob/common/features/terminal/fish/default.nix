{
  pkgs,
  config,
  ...
}: {
  home.file.".config/fish" = {
    source = config.lib.file.mkOutOfStoreSymlink "${builtins.toString ./.}/dotfiles";
    recursive = true;
  };

  programs = {
    zoxide.enable = true;
    fzf.enable = true;
  };
}
