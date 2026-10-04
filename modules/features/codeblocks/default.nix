{
  flake.homeModules.codeblocks = {pkgs, ...}: {
    home.packages = [
      pkgs.codeblocksFull
      pkgs.gcc
    ];
  };
}
