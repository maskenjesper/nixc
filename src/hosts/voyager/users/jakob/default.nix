{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../home_manager_modules/terminal/nixCats
    ../home_manager_modules/git
    ../home_manager_modules/desktop_apps
    ../home_manager_modules/terminal/kitty
    ../home_manager_modules/terminal/lf
    ../home_manager_modules/terminal/zsh
    ../home_manager_modules/terminal/fish
    ../home_manager_modules/terminal/tmux
    ../home_manager_modules/hyprland
    ../home_manager_modules/rofi
    ../home_manager_modules/ags
    ../home_manager_modules/waybar
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
