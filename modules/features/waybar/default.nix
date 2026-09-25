{
  flake.homeModules.waybar = {config, ...}: {
    home.file.".config/waybar".source =
      if !config.dotfiles.mutable
      then ./dotfiles
      else config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/modules/features/waybar/dotfiles";
  };
}
