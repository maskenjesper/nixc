{
  pkgs,
  config,
  ...
}: {
  home.file.".config/just" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/tasks/dotfiles";
    recursive = true;
  };

  home.packages = with pkgs; [
    just
  ];
}
