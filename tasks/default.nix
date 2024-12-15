{
  pkgs,
  config,
  ...
}: {
  home.file.".config/just" = {
    source = config.lib.file.mkOutOfStoreSymlink "${builtins.toString ./.}/dotfiles";
    recursive = true;
  };

  home.packages = with pkgs; [
    just
  ];
}
