{
  flake.homeModules.fish = {config, ...}: {
    home.file.".config/fish" = {
      # source = ./dotfiles;
      source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/modules/features/fish/dotfiles";
      recursive = true;
    };

    programs = {
      tmux.enable = true;
      zoxide.enable = true;
      fzf.enable = true;
    };
  };
}
