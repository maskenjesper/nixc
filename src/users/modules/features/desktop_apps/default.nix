{pkgs, ...}: {
  home.packages = with pkgs; [
    gucharmap
    _1password-gui
    obsidian
    spotify
    discord
    brave
  ];
}
