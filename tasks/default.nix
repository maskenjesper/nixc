{
  pkgs,
  config,
  outputs,
  ...
}: {
  home.file.".config/just" = {
    source = config.lib.file.mkOutOfStoreSymlink "${outputs.customLib.currentDir}/dotfiles";
    recursive = true;
  };

  home.packages = with pkgs; [
    just
  ];
}
