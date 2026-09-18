{config, pkgs, ...}: {
  home.file.".config/noctalia" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/modules/desktop-environments/noctalia/homeManager/dotfiles";
    recursive = true;
  };

  home.packages = with pkgs; [
    noctalia-shell
  ];
}
