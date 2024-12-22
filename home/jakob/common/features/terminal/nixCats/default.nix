{
  config,
  lib,
  inputs,
  ...
}: let
  utils = inputs.nixCats.utils;
in {
  imports = [
    inputs.nixCats.homeModule
  ];

  # this value, nixCats is the defaultPackageName you pass to mkNixosModules
  # it will be the namespace for your options.
  nixCats = {
    # these are some of the options. For the rest see
    # :help nixCats.flake.outputs.utils.mkNixosModules
    # you do not need to use every option here, anything you do not define
    # will be pulled from the flake instead.
    enable = true;
    nixpkgs_version = inputs.nixpkgs;
    # this will add the overlays from ./overlays and also,
    # add any plugins in inputs named "plugins-pluginName" to pkgs.neovimPlugins
    # It will not apply to overall system, just nixCats.
    addOverlays =
      /*
      (import ./overlays inputs) ++
      */
      [
        (utils.standardPluginOverlay inputs)
      ];
    packageNames = ["nixCats"];

    luaPath = "${./dotfiles}";
    # you could also import lua from the flake though, by not including this.

    # categoryDefinitions.replace will replace the whole categoryDefinitions with a new one
    categoryDefinitions.replace = {
      pkgs,
      settings,
      categories,
      extra,
      name,
      mkNvimPlugin,
      ...
    } @ packageDef: {
      lspsAndRuntimeDeps = {
        general = with pkgs; [
          universal-ctags
          ripgrep
          fd
          zoxide
          fzf

          fish-lsp

          gopls
          gotools
          go-tools
          gccgo

          bash-language-server
          shfmt

          nix-doc
          nixd
          alejandra

          lua-language-server
          stylua

          elixir-ls
        ];

        langs = with pkgs; {
          go = [
            gopls
            gotools
            go-tools
            gccgo
          ];

          bash = [
            bash-language-server
            shfmt
          ];

          nix = [
            nix-doc
            nixd
            alejandra
          ];

          lua = [
            lua-language-server
            stylua
          ];

          elixir = [
            elixir-ls
          ];

          dart = [
            lsp-dart
          ];

          yaml = [
            yamlfmt
            yaml-language-server
            yaml-filter
          ];
        };
      };
      startupPlugins = {
        general = with pkgs.vimPlugins; [
          lze
          oil-nvim
          vim-repeat
          plenary-nvim
          nvim-web-devicons
          markview-nvim
        ];

        themer = with pkgs.vimPlugins; [
          # you can even make subcategories based on categories and settings sets!
          (
            builtins.getAttr packageDef.categories.colorscheme {
              "onedark" = onedark-nvim;
              "catppuccin" = catppuccin-nvim;
              "catppuccin-mocha" = catppuccin-nvim;
              "tokyonight" = tokyonight-nvim;
              "tokyonight-day" = tokyonight-nvim;
              "rose-pine" = rose-pine;
              "gruvbox" = gruvbox-nvim;
            }
          )
        ];
      };

      optionalPlugins = {
        general = with pkgs.vimPlugins; [
          indent-blankline-nvim
          obsidian-nvim

          telescope-fzf-native-nvim
          telescope-ui-select-nvim
          telescope-nvim

          snacks-nvim

          nvim-cmp
          luasnip
          friendly-snippets
          cmp_luasnip
          cmp-buffer
          cmp-path
          cmp-nvim-lua
          cmp-nvim-lsp
          cmp-cmdline
          cmp-nvim-lsp-signature-help
          cmp-cmdline-history
          lspkind-nvim

          nvim-treesitter-textobjects
          nvim-treesitter.withAllGrammars

          which-key-nvim

          autoclose-nvim

          neoscroll-nvim

          dressing-nvim

          comment-nvim

          harpoon

          vim-tmux-navigator

          lualine-nvim

          nvim-tree-lua
        ];

        lint = with pkgs.vimPlugins; [
          nvim-lint
        ];

        debug = with pkgs.vimPlugins; [
          nvim-dap
          nvim-dap-ui
          nvim-dap-virtual-text
        ];

        format = with pkgs.vimPlugins; [
          conform-nvim
        ];

        lsp = with pkgs.vimPlugins; [
          nvim-lspconfig
        ];
      };

      environmentVariables = {
        elixir = {
          elixirls = "${pkgs.elixir_ls}/language-server.sh";
        };
      };
    };

    packageDefinitions.replace = {
      nixCats = {pkgs, ...}: {
        settings = {
          unwrappedCfgPath = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/home/jakob/common/features/terminal/nixCats/dotfiles";
          aliases = ["vim" "homeVim"];
        };

        categories = {
          general = true;
          themer = true;
          colorscheme = "gruvbox";

          lint = true;
          debug = true;
          format = true;
          lsp = true;

          bash = true;
          go = true;
          nix = true;
          elixir = true;
          lua = true;
          dart = true;
          yaml = true;
        };
      };
    };
  };
}
