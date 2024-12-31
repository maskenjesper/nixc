{
  pkgs,
  config,
  ...
}: {
  home.file.".config/hypr" = {
    # TODO: Get working. Still makes symlink to store
    # Dafuq? It seems to be working anyhow
    # Sadly, the line below forces this repository to be placed directly under the users home and have the name nixc. I can live with this however.
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/home/jakob/common/features/hyprland/dotfiles";
    recursive = true;
  };

  # Explicitly avoids conficts with uswm
  wayland.windowManager.hyprland.systemd.enable = false;
}
