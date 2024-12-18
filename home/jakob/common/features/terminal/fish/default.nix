{
  pkgs,
  config,
  ...
}: {
  home.file.".config/fish" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/home/jakob/common/features/terminal/fish/dotfiles";
    recursive = true;
  };

  home.packages = with pkgs; [
    sqlite
    which
  ];

  programs = {
    # to solve implicit which error
    zoxide.enable = true;
    fzf.enable = true;
  };
}
