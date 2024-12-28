{
  pkgs,
  config,
  outputs,
  ...
}: {
  home.file.".config/wezterm" = {
    source = ./dotfiles;
    recursive = true;
  };

  programs.wezterm.enable = true;
}
