
{pkgs, ...}: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia.modesetting.enable = true;
  hardware.steam-hardware.enable = true;

  environment.systemPackages = with pkgs; [
    mangohud
    lutris
    r2modman
    gamescope
    protonup-qt
  ];

  programs = {
    steam.enable = true;
    steam.gamescopeSession.enable = true;
    gamemode.enable = true;
  };
}
