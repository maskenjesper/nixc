{
  flake.nixosModules.gaming = {pkgs, ...}: {
    # Steam Hardware Curry and other nobara packages
    hardware.steam-hardware.enable = true;

    environment.systemPackages = [
      pkgs.mangohud
      pkgs.r2modman
      pkgs.protonup-qt
      pkgs.gamemode
      pkgs.vulkan-tools
      pkgs.mesa
      pkgs.wayland-protocols
      pkgs.xwayland
      pkgs.libxcb

      (pkgs.heroic.override {
        extraPkgs = pkgs: [
          pkgs.gamescope
        ];
      })
    ];

    # Fix steam on nixos
    programs = {
      steam.enable = true;
      steam.gamescopeSession.enable = true;
      gamemode.enable = true;
      gamescope.enable = true;
    };
  };
}
