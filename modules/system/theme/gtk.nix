{
  self,
  inputs,
  moduleWithSystem,
  ...
}: {
  flake.nixosModules.system-theme-gtk = moduleWithSystem (
    {
      self',
      pkgs,
      ...
    }: {
      environment.systemPackages = [
        pkgs.gnome-themes-extra
      ];
      programs = {
        xfconf.enable = true;
        dconf = {
          enable = true;
          profiles.user.databases = [
            {
              lockAll = false;
              settings = {
                "org/gnome/desktop/interface" = {
                  gtk-theme = "Adwaita-dark";
                  icon-theme = "Papirus-Dark";
                  color-scheme = "prefer-dark";
                };
              };
            }
          ];
        };
      };
    }
  );
}