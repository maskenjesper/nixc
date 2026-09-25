{
  flake.homeModules.fish = {config, ...}: {
    home.file.".config/fish" = {
      source = config.lib.file.mkOutOfStoreSymlink "${toString ./.}/dotfiles";
    };

    programs = {
      tmux.enable = true;
      zoxide.enable = true;
      fzf.enable = true;
    };
  };
}
