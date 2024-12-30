{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.packages = [
    inputs.xremap.packages.x86_64-linux.default
  ];

  home.file.".config/xremap" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/home/jakob/common/features/xremap/dotfiles";
    recursive = true;
  };
}
