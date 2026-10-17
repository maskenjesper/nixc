{
  self,
  inputs,
  lib,
  config,
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

        settings.config_directory =
          if config.dotfiles.mutable
          then lib.generators.mkLuaInline "vim.fn.expand('$HOME/nixc/modules/features/neovim/dotfiles')"
          else ./dotfiles;

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
