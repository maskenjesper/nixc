{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../modules/terminal/nixCats
    ../modules/git
    ../modules/desktop_apps
    ../modules/terminal/kitty
    ../modules/terminal/lf
    ../modules/terminal/zsh
    ../modules/terminal/tmux
    ../modules/hyprland
    ../modules/rofi
    ../modules/ags
    ../modules/waybar
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
