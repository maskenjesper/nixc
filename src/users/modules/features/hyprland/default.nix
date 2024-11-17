{
  pkgs,
  config,
  ...
}: {
  home.file.".config/hypr" = {
    # TODO: Get working. Still makes symlink to store
    # Dafuq? It seems to be working anyhow
    # Sadly, the line below forces this repository to be placed directly under the users home and have the name nixc. I can live with this however.
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/src/users/modules/features/hyprland/dotfiles";
    recursive = true;
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  # Explicitly avoids conficts with uswm
  wayland.windowManager.hyprland.systemd.enable = false;

  gtk = {
    enable = true;

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };
    font = {
      name = "Sans";
      size = 11;
    };
  };
}
