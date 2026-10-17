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
            pkgs.vimPlugins.oil-nvim
            pkgs.vimPlugins.nvim-web-devicons
            pkgs.vimPlugins.mini-icons
            pkgs.vimPlugins.kanagawa-nvim
            pkgs.vimPlugins.vim-tmux-navigator
          ];
          lazy = {
            lazy = true;
            data = [
              pkgs.vimPlugins.telescope-fzf-native-nvim
              pkgs.vimPlugins.telescope-ui-select-nvim
              pkgs.vimPlugins.telescope-nvim
              pkgs.vimPlugins.harpoon
              pkgs.vimPlugins.lualine-nvim
              pkgs.vimPlugins.conform-nvim
              pkgs.vimPlugins.which-key-nvim
              pkgs.vimPlugins.nvim-treesitter-textobjects
              pkgs.vimPlugins.nvim-treesitter.withAllGrammars
            ];
          };
          git = {
            lazy = true;
            data = [
              pkgs.vimPlugins.vim-fugitive
              pkgs.vimPlugins.gitsigns-nvim
            ];
          };
          lint = {
              lazy = true;
              data = [
              pkgs.vimPlugins.nvim-lint
          ];

          };
          completion = {
            lazy = true;
            data = [
              pkgs.vimPlugins.nvim-cmp
              pkgs.vimPlugins.cmp_luasnip
              pkgs.vimPlugins.cmp-buffer
              pkgs.vimPlugins.cmp-path
              pkgs.vimPlugins.cmp-nvim-lua
              pkgs.vimPlugins.cmp-nvim-lsp
              pkgs.vimPlugins.cmp-cmdline
              pkgs.vimPlugins.cmp-nvim-lsp-signature-help
              pkgs.vimPlugins.cmp-cmdline-history
              pkgs.vimPlugins.luasnip
              pkgs.vimPlugins.friendly-snippets
              pkgs.vimPlugins.lspkind-nvim
            ];
          };
        };

        runtimePkgs = [
          # general
          pkgs.universal-ctags
          pkgs.ripgrep
          pkgs.fd
          pkgs.zoxide
          pkgs.fzf

          # nix
          pkgs.nixd
          pkgs.alejandra

          # lua
          pkgs.lua-language-server
          pkgs.stylua

          # clang
          pkgs.clang
          pkgs.clang-tools

          # cmake
          pkgs.cmake-language-server
          pkgs.cmake-format
          pkgs.cmake-lint
        ];
      }
    );
  };
}
