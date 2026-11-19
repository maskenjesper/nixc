{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.cursor = {
    pkgs,
    lib,
    ...
  }: let
  in {
    environment.systemPackages = [
      pkgs.bibata-cursors
      pkgs.banana-cursor
    ];

    environment.sessionVariables = {
      # Doesn't do anything on wayland. Configure in compositor instead.
      XCURSOR_THEME = "Banana";
      XCURSOR_SIZE = "20";
    };

    programs.dconf.profiles.user.databases = [
      {
        lockAll = false;
        settings = {
          "org/gnome/desktop/interface" = {
            cursor-theme = "Banana";
          };
        };
      }
    ];
  };
}
