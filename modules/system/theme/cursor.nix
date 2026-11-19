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
