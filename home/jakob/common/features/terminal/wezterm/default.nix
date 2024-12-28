{
  pkgs,
  config,
  outputs,
  ...
}: {
  home.file.".config/wezterm" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/home/jakob/common/features/terminal/wezterm/dotfiles";
    recursive = true;
  };

  programs.wezterm.enable = true;
}
