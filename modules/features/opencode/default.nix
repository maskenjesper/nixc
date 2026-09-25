{
  flake.homeModules.opencode = {config, ...}: {
    home.file.".config/opencode".source =
      if !config.dotfiles.mutable
      then ./dotfiles
      else config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/modules/features/opencode/dotfiles";

    programs.opencode = {
      enable = true;
    };
  };
}
