{
  self,
  inputs,
  ...
}: {
  flake.homeConfigurations."jakob@saturn" = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    modules = [
      ({pkgs, ...}: {
        imports = with self.homeModules; [
          dotfiles
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
          opencode
        ];

        home.username = "jakob";
        home.homeDirectory = "/home/jakob";

        home.packages = with pkgs; [
          keepassxc
          usbimager
        ];

        home.stateVersion = "24.05"; # Please read the comment before changing.

        programs.home-manager.enable = true;
      })
    ];
  };
}
