{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.font = {
    pkgs,
    lib,
    ...
  }: let
  in {
    fonts.packages = [
      pkgs.nerd-fonts.fira-mono
    ];

    programs.dconf.profiles.user.databases = [
      {
        lockAll = false;
        settings = {
          "org/gnome/desktop/interface" = {
            font-name = "FiraMono Nerd Font 11";
          };
        };
      }
    ];
  };
}
