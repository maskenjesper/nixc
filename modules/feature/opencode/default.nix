{
  flake.homeModules.opencode = {config, ...}: {
    home.file.".config/opencode" = {
      source = ./dotfiles;
      recursive = true;
    };
  };
}