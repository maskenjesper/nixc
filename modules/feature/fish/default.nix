{
  flake.homeModules.fish = {config, ...}: {
    home.file.".config/fish" = {
      source = ./dotfiles;
      recursive = true;
    };

    programs = {
      tmux.enable = true;
      zoxide.enable = true;
      fzf.enable = true;
    };
  };
}
