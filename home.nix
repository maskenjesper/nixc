{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.ags.homeManagerModules.default];

  home.username = "jakob";
  home.homeDirectory = "/home/jakob";

  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = [
    pkgs.neovim
    pkgs.kitty
    pkgs.hyprpanel
  ];

  home.file = {
    ".zshrc".source = ./dotfiles/.zshrc;
    ".p10k.zsh".source = ./dotfiles/.p10k.zsh;
    ".scripts/tmux-sessionizer.sh".source = ./dotfiles/.scripts/tmux-sessionizer.sh;
    ".config/kitty".source = ./dotfiles/.config/kitty;
    ".config/nvim".source = ./dotfiles/.config/nvim;
    ".config/rofi".source = ./dotfiles/.config/rofi;
    ".config/tmux".source = ./dotfiles/.config/tmux;
    ".config/hypr".source = ./dotfiles/.config/hypr;
  };

  home.sessionVariables = {
  };

  programs = {
    ags = {
      enable = true;
      configDir = ./dotfiles/.config/ags;

      extraPackages = with pkgs; [
        gtksourceview
        webkitgtk
        accountsservice
      ];
    };
    git = {
      enable = true;
      userName = "jakob";
      userEmail = "noreply@email.com";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };
    gh.enable = true;
    bash = {
      enable = true;
      shellAliases = {
        ll = "ls -l";
        ".." = "cd ..";
      };
    };
    zoxide.enable = true;
    fzf.enable = true;
    tmux.enable = true;
    kitty.enable = true;
  };

  programs.home-manager.enable = true;
}
