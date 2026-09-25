{
  flake.homeModules.gh = {config, ...}: {
    programs.gh.enable = true;

    home.file.".config/gh".source = ./dotfiles;
  };
}
