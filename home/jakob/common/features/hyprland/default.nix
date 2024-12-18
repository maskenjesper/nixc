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

  # home.pointerCursor = {
  #   gtk.enable = true;
  #   package = pkgs.bibata-cursors;
  #   name = "Bibata-Modern-Classic";
  #   size = 26;
  # };

  # Explicitly avoids conficts with uswm
  wayland.windowManager.hyprland.systemd.enable = false;

  # gtk = {
  #   enable = true;
  #
  #   # To find the name of a theme in a package use nix build on the package and look inside
  #   # cd $(nix build nixpkgs#packageName --print-out-paths --no-link)
  #   theme = {
  #     package = pkgs.arc-kde-theme;
  #     name = "ArcDark";
  #   };
  #
  #   iconTheme = {
  #     package = pkgs.papirus-icon-theme;
  #     name = "Papirus-Dark";
  #   };
  #   font = {
  #     name = "Sans";
  #     size = 11;
  #   };
  # };
  #
  # qt = {
  #   enable = true;
  #
  #   platformTheme.name = "qtct";
  #
  #   style = {
  #     package = pkgs.adwaita-qt;
  #     name = "adwaita-dark";
  #   };
  # };
}
