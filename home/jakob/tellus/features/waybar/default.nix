{
  pkgs,
  config,
  ...
}: {
  home.file.".config/waybar" = {
    source = config.lib.file.mkOutOfStoreSymlink "${builtins.toString ./.}/dotfiles";
    recursive = true;
  };
}
