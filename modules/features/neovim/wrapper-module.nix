{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.neovim = {pkgs, ...}: {
    environment.systemPackages = [
      self.packages.${pkgs.system}.neovim
    ];
  };

  perSystem = {pkgs, ...}: {
    packages.neovim = inputs.wrapper-modules.wrappers.neovim.wrap (
      {...}: {
        inherit pkgs;

        settings.config_directory = ./dotfiles;

        specs = {
          general = [
            pkgs.vimPlugins.lze
            pkgs.vimPlugins.nvim-lspconfig
            pkgs.vimPlugins.telescope-nvim
            pkgs.vimPlugins.plenary-nvim
          ];
        };
        runtimePkgs = [
          pkgs.ripgrep
          pkgs.fd
        ];
      }
    );
  };
}
