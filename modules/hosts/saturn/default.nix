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

          inputs.nix-index-database.nixosModules.nix-index
        ];

        nh.enable = true;

        networking.hostName = "saturn"; # Define your hostname.

        environment.systemPackages = [
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
          pkgs.stoat-desktop
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
