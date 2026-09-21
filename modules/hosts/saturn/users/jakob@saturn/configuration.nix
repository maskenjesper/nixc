{
  self,
  inputs,
  ...
}: {
  flake.homeModules.saturn-jakob-configuration = {pkgs, ...}: {
    imports = with self.homeModules; [
      niri
      noctalia
      fish
      tmux
      direnv
      kitty
      git
      gh
      lazygit
      neovim
      just
    ];

    home.username = "jakob";
    home.homeDirectory = "/home/jakob";

    home.packages = with pkgs; [
      keepassxc
      usbimager
    ];

    home.stateVersion = "24.05"; # Please read the comment before changing.

    programs.home-manager.enable = true;
  };
}
