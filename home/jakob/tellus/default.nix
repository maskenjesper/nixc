{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
#    ../common/features/terminal/nixCats
#    ../common/features/git
#    ../common/features/desktop_apps
#    ../common/features/terminal/kitty
#    ../common/features/terminal/lf
#    ../common/features/terminal/zsh
#    ../common/features/terminal/fish
#    ../common/features/terminal/tmux
#    ../common/features/hyprland
#    ../common/features/rofi
#    ../common/features/ags
#    ../common/features/waybar

    ../common/global
    ../common/features/terminal/nixCats
    ../common/features/git
    ../common/features/git/gh
    ../common/features/terminal/kitty
    ../common/features/terminal/lf
    ../common/features/terminal/zsh
    ../common/features/terminal/fish
    ../common/features/terminal/tmux
    ../common/features/hyprland
    ../common/features/rofi
    ../common/features/waybar
    ../common/features/desktop/common/wayland/wofi
    ../common/features/stylix
    ../common/features/kanshi
  ];

  home.username = "jakob";
  home.homeDirectory = "/home/jakob";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  home.packages = with pkgs; [
    protonup
    anki-bin
  ];

  home.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatabilitytools.d";
  };

  programs = {
    bash = {
      enable = true;
      shellAliases = {
        ll = "ls -l";
        ".." = "cd ..";
      };
    };
    zoxide.enable = true;
    fzf.enable = true;
    kitty.enable = true;
  };

  programs.home-manager.enable = true;
}
