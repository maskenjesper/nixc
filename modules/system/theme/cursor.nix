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
    fonts.packages = [
      pkgs.nerd-fonts.fira-mono
    ];
    environment.systemPackages = [
      pkgs.bibata-cursors
      pkgs.banana-cursor
    ];

    environment.variables = {
      XCURSOR_THEME = "Banana";
      XCURSOR_SIZE = "20";
    };

    programs.dconf.profiles.user.databases = [
      {
        lockAll = false;
        settings = {
          "org/gnome/desktop/interface" = {
            cursor-theme = "Banana";
            font-name = "FiraMono Nerd Font 11";
          };
        };
      }
    ];
  };
}
