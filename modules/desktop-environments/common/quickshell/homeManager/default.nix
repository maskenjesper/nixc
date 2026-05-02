{
  pkgs,
  config,
  ...
}: {

  home.file.".config/quickshell" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/modules/desktop-environments/common/quickshell/homeManager/dotfiles";
    recursive = true;
  };
}
