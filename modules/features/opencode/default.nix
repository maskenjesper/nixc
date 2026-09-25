{
  flake.homeModules.opencode = {config, ...}: {
    home.file.".config/opencode" = {
      source = ./dotfiles;
      recursive = true;
    };

    programs.opencode = {
      enable = true;
    };
  };
}
