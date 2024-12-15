{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./features/terminal/nixCats
    ./features/git
    ./features/desktop_apps
    ./features/terminal/kitty
    ./features/terminal/lf
    ./features/terminal/zsh
    ./features/terminal/fish
    ./features/terminal/tmux
    ./features/hyprland
    ./features/rofi
    ./features/ags
    ./features/waybar
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
