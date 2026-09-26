{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.saturn = inputs.nixpkgs.lib.nixosSystem {
    specialArgs = {
      localUsers = ["jakob"];
    };
    modules = [
      ({pkgs, ...}: {
        imports = with self.nixosModules; [
          niri
          noctalia
          theme
          core
          network
          nix-ld
          audio
          amd-gpu
          upower
          adb
          nh
          gaming
          virtualization
          ssh
          appimage
          nautilus

          syncthing

          inputs.nix-index-database.nixosModules.nix-index
        ];

        nh.enable = true;

        syncthing = {
          devices = {
            "phone" = {id = "3Y7HXLU-57OAFNZ-MO5PJ2T-PY7MOPA-U6RHHGF-4BUQEGX-7JRNZBZ-Q4CAAAP";};
            "laptop" = {id = "NGB3ZV7-5TUJBHD-S4G55WQ-GB2IJKU-T27F57R-KYUUW6O-ABBPROL-WXS3WAW";};
            "rpi" = {id = "";};
          };
          passwords.devices = ["phone" "rpi"];
          second-brain.devices = ["phone" "rpi"];
        };

        networking.hostName = "saturn"; # Define your hostname.

        environment.systemPackages = [
          pkgs.rustdesk

          pkgs.pkgit

          pkgs.stoat-desktop

          pkgs.resources
          pkgs.spotify
          pkgs.keepassxc
          pkgs.vivaldi
          pkgs.discord
          pkgs.meld
          pkgs.modrinth-app
          pkgs.audacity
          pkgs.evolution
          pkgs.signal-cli
          pkgs.signal-desktop
          pkgs.audacious
          pkgs.snapper
          pkgs.snapper-gui
          pkgs.obsidian
          pkgs.cheat
          pkgs.broot
          pkgs.rnote
          pkgs.zellij
          pkgs.homebank
          pkgs.nnn
          pkgs.rclone
          pkgs.rclone-ui
          pkgs.evince
          pkgs.deluge
          pkgs.gnome-multi-writer

          # Just trying out installing a package from a flake.
          # The issue is the handling of system. I think there's
          # a better way.
          #inputs.nix-melt.packages."x86_64-linux".default
          # It's also available in nixpkgs:
          pkgs.nix-melt
        ];
      })
    ];
  };
}
