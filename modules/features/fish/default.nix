{
  flake.homeModules.fish = {config, ...}: {
    home.file.".config/fish".source =
      if !config.dotfiles.mutable
      then ./dotfiles
      else config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/modules/features/fish/dotfiles";

    programs = {
      tmux.enable = true;
      zoxide.enable = true;
      fzf.enable = true;
    };
  };
}
