{
  self,
  inputs,
  ...
}: {
  flake.homeModules."jakob@saturn" = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      # ../../../../modules/terminal/apps/nixCats/homeManager
      # ../../../../modules/terminal/apps/direnv/homeManager
      # ../../../../modules/terminal/apps/tmux/homeManager
      # ../../../../modules/terminal/emulators/kitty/homeManager
      # ../../../../modules/terminal/apps/git/homeManager
      # ../../../../modules/terminal/apps/gh/homeManager
      # ../../../../modules/terminal/apps/lazygit/homeManager
      # ../../../../modules/terminal/shells/fish/homeManager
      # ../../../../modules/desktop-environments/niri/homeManager
      # ../../../../modules/desktop-environments/noctalia/homeManager
    ];

    home.username = "jakob";
    home.homeDirectory = "/home/jakob";

    # For packages that need no configuration (yet...)
    home.packages = with pkgs; [
      keepassxc
      usbimager
      vivaldi
    ];

    home.stateVersion = "24.05"; # Please read the comment before changing.

    programs.home-manager.enable = true;
  };
}
