{
  self,
  inputs,
  ...
}:
{
  flake.homeConfigurations."jakob@saturn" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    modules = [
      ({ pkgs, ... }: {
        imports = [
          self.homeModules.dotfiles
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
          self.homeModules.opencode
        ];

        dotfiles.mutable = true;

        home.username = "jakob";
        home.homeDirectory = "/home/jakob";

        home.packages = [
          pkgs.keepassxc
          pkgs.usbimager
        ];

        home.stateVersion = "24.05"; # Please read the comment before changing.

        programs.home-manager.enable = true;
      })
    ];
  };
}
