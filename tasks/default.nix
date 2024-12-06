{
  pkgs,
  config,
  ...
}: {
  home.file.".config/just" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/tasks/just";
    recursive = true;
  };
}
