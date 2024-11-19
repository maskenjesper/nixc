{
  config,
  pkgs,
  inputs,
  user,
  ...
}: {
  imports = [
    ../modules/features/git
    ../modules/features/desktop_apps
    ../modules/features/terminal/kitty
    ../modules/features/terminal/lf
    ../modules/features/terminal/zsh
    ../modules/features/terminal/tmux
    ../modules/features/terminal/neovim
    ../modules/features/hyprland
    ../modules/features/rofi
    ../modules/features/ags
    ../modules/features/waybar
  ];

  home.username = "${user}";
  home.homeDirectory = "/home/${user}";

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
