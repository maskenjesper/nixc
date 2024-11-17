{
  pkgs,
  config,
  ...
}: {
  home.file.".config/kitty" = {
    source = "${config.home.homeDirectory}/nixc/src/users/modules/features/terminal/kitty/dotfiles";
    recursive = true;
  };
}
