{
  flake.homeModules.just = {
    pkgs,
    config,
    ...
  }: {
    home.file.".config/just" = {
      source = ./dotfiles;
      recursive = true;
    };

    home.packages = with pkgs; [
      just
    ];
  };
}
