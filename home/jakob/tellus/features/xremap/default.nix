{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.packages = [
    inputs.xremap.packages.x86_64-linux.default
    pkgs.wtype
  ];

  home.file.".config/xremap" = {
    source = config.lib.file.mkOutOfStoreSymlink "${builtins.toString ./.}/dotfiles";
    recursive = true;
  };
}
