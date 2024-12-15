{
  pkgs,
  config,
  outputs,
  ...
}: {
  home.file.".config/fish" = {
    source = config.lib.file.mkOutOfStoreSymlink "${outputs.customLib.currentDir}/dotfiles";
    recursive = true;
  };

  programs = {
    zoxide.enable = true;
    fzf.enable = true;
  };
}
