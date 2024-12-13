{
  pkgs,
  config,
  ...
}: {
  home.file = {
    ".zshrc".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/src/users/modules/terminal/zsh/.zshrc";
    ".p10k.zsh".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/src/users/modules/terminal/zsh/.p10k.zsh";
  };
}
