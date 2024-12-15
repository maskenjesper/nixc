{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../common/global
    ../common/features/terminal/nixCats
    ../common/features/git
    ../common/features/desktop_apps
    ../common/features/terminal/kitty
    ../common/features/terminal/lf
    ../common/features/terminal/zsh
    ../common/features/terminal/fish
    ../common/features/terminal/tmux
    ../common/features/hyprland
    ../common/features/rofi
    ../common/features/waybar
    ../common/features/desktop/common/wayland/wofi
  ];

  home.username = "jakob";
  home.homeDirectory = "/home/jakob";

  home.packages = with pkgs; [
    anki-bin
  ];

  home.stateVersion = "24.05"; # Please read the comment before changing.

  programs.home-manager.enable = true;
}
