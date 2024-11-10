{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ../modules/features/tmux
    ../modules/features/git
    ../modules/features/desktop_apps
  ];

  home.username = "jakob";
  home.homeDirectory = "/home/jakob";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    neovim
    kitty
    protonup
  ];

  home.file = {
    ".zshrc".source = ./dotfiles/.zshrc;
    ".p10k.zsh".source = ./dotfiles/.p10k.zsh;
    ".config/kitty".source = ./dotfiles/.config/kitty;
    ".config/nvim".source = ./dotfiles/.config/nvim;
    ".config/rofi".source = ./dotfiles/.config/rofi;
    ".config/hypr".source = ./dotfiles/.config/hypr;
  };

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
