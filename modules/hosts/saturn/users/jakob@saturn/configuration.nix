{
  self,
  inputs,
  ...
}: {
  flake.homeModules.saturn-jakob-configuration = {pkgs, ...}: {
    imports = [
      self.homeModules.niri
      self.homeModules.noctalia
      self.homeModules.fish
      self.homeModules.tmux
      self.homeModules.direnv
      self.homeModules.kitty
      self.homeModules.git
      self.homeModules.gh
      self.homeModules.lazygit
      self.homeModules.neovim
      self.homeModules.just
      self.homeModules.ghostty
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
