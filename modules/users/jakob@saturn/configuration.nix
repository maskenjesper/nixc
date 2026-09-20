{
  self,
  inputs,
  ...
}: {
  flake.homeModules.saturn-jakob-configuration = {pkgs, ...}: {
    imports = [
      # ../../../../../modules_back/terminal/apps/nixCats/homeManager
      # ../../../../../modules_back/terminal/apps/direnv/homeManager
      # ../../../../../modules_back/terminal/apps/tmux/homeManager
      # ../../../../../modules_back/terminal/emulators/kitty/homeManager
      # ../../../../../modules_back/terminal/apps/git/homeManager
      # ../../../../../modules_back/terminal/apps/gh/homeManager
      # ../../../../../modules_back/terminal/apps/lazygit/homeManager
      self.homeModules.fish
    ];

    home.username = "jakob";
    home.homeDirectory = "/home/jakob";

    home.packages = with pkgs; [
      keepassxc
      usbimager

      hello
    ];

    home.stateVersion = "24.05"; # Please read the comment before changing.

    programs.home-manager.enable = true;
  };
}
