{
  flake.nixosModules.gaming = {pkgs, ...}: {
    # Steam Hardware Curry and other nobara packages
    hardware.steam-hardware.enable = true;

    environment.systemPackages = with pkgs; [
      mangohud
      r2modman
      protonup-qt
      gamemode
      vulkan-tools
      mesa
      wayland-protocols
      xwayland
      xorg.libxcb

      (heroic.override {
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