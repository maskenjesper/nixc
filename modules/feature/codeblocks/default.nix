{
  flake.homeModules.codeblocks = {pkgs, ...}: {
    home.packages = with pkgs; [
      codeblocksFull
      gcc
    ];
  };
}