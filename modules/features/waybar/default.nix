{
  flake.homeModules.waybar = {config, ...}: {
    home.file.".config/waybar" = {
      source = ./dotfiles;
      recursive = true;
    };
  };
}