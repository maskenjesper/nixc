{
  flake.homeModules.lazygit = {config, ...}: {
    programs.lazygit.enable = true;
  };
}
