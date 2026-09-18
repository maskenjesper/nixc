{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # nixified
    ../../../modules/terminal/apps/nixCats/homeManager
    ../../../modules/terminal/apps/direnv/homeManager
    ../../../modules/terminal/apps/tmux/homeManager

    # Only dots
    ../../../modules/terminal/emulators/kitty/homeManager
    ../../../modules/terminal/apps/git/homeManager
    ../../../modules/terminal/apps/gh/homeManager
    ../../../modules/terminal/apps/lazygit/homeManager
    ../../../modules/terminal/shells/fish/homeManager

    # ../../../modules/apps/opencode/homeManager/dotfiles.nix

    ../../../modules/desktop-environments/niri/homeManager
    ../../../modules/desktop-environments/noctalia/homeManager
  ];

  home.username = "jakob";
  home.homeDirectory = "/home/jakob";

  # nixpkgs.config.permittedInsecurePackages = [
  #   "ventoy-gtk3-1.1.07"
  # ];

  # For packages that need no configuration (yet...)
  home.packages = with pkgs; [
    # Trying out
    keepassxc
    usbimager

    vivaldi
  ];

  home.stateVersion = "24.05"; # Please read the comment before changing.

  programs.home-manager.enable = true;
}
