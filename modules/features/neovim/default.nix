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
      pkgs.neovide
    ];
  };

  perSystem = {pkgs, ...}: {
    packages.neovim = inputs.wrapper-modules.wrappers.neovim.wrap (
      {...}: {
        inherit pkgs;

        settings.config_directory =
          if config.dotfiles.mutable
          then
            lib.generators.mkLuaInline
            "vim.fn.expand('$HOME/nixc/modules/features/neovim/dotfiles')"
          else ./dotfiles;

        specs = {
          general = [
            pkgs.vimPlugins.lze
            pkgs.vimPlugins.nvim-lspconfig
            pkgs.vimPlugins.nvim-treesitter-textobjects
            pkgs.vimPlugins.nvim-treesitter-context
            pkgs.vimPlugins.nvim-treesitter.withAllGrammars
            pkgs.vimPlugins.plenary-nvim
            pkgs.vimPlugins.nvim-web-devicons
            pkgs.vimPlugins.mini-icons
            pkgs.vimPlugins.kanagawa-nvim
            pkgs.vimPlugins.vim-tmux-navigator
            pkgs.vimPlugins.mini-nvim
            pkgs.vimPlugins.fzf-lua
            pkgs.vimPlugins.flash-nvim
          ];
          lazy = {
            lazy = true;
            data = [
              pkgs.vimPlugins.render-markdown-nvim
              pkgs.vimPlugins.quicker-nvim
              pkgs.vimPlugins.telescope-fzf-native-nvim
              pkgs.vimPlugins.telescope-ui-select-nvim
              pkgs.vimPlugins.telescope-nvim
              pkgs.vimPlugins.harpoon
              pkgs.vimPlugins.lualine-nvim
              pkgs.vimPlugins.conform-nvim
              pkgs.vimPlugins.which-key-nvim
              pkgs.vimPlugins.vim-fugitive
              pkgs.vimPlugins.gitsigns-nvim
              pkgs.vimPlugins.nvim-lint
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
              pkgs.vimPlugins.roslyn-nvim
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
          pkgs.tree-sitter

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

          # c#
          pkgs.roslyn-ls

          # Web
          pkgs.vscode-css-languageserver
          pkgs.vscode-html-languageserver
          pkgs.htmx-lsp2
          pkgs.jinja-lsp
        ];
      }
    );
  };
}
