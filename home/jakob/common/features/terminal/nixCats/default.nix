{
  config,
  inputs,
  ...
}: let
  utils = inputs.nixCats.utils;
in {
  imports = [
    inputs.nixCats.homeModule
  ];

  nixCats = {
    enable = true;
    nixpkgs_version = inputs.nixpkgs;
    addOverlays = [
      (utils.standardPluginOverlay inputs)
    ];
    packageNames = ["nixCats" "testCats"];

    luaPath = "${./dotfiles}";

    categoryDefinitions.replace = {pkgs, ...} @ packageDef: {
      lspsAndRuntimeDeps.general = with pkgs; [
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

        dart

        yamlfmt
        yaml-language-server

        hyprls 
      ];

      startupPlugins.general = with pkgs.vimPlugins; [
        lze
        oil-nvim
        vim-repeat
        plenary-nvim
        nvim-web-devicons
        markview-nvim
        gruvbox-nvim
      ];

      optionalPlugins.general = with pkgs.vimPlugins; [
        hologram-nvim
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

        #lint
        nvim-lint

        #debug
        nvim-dap
        nvim-dap-ui
        nvim-dap-virtual-text

        #format
        conform-nvim

        #lsp
        nvim-lspconfig
      ];

      environmentVariables.general = {
      };
    };

    packageDefinitions.replace = {
      nixCats = {...}: {
        settings = {
          aliases = ["vim"];
        };

        categories = {
          general = true;
        };
      };
      testCats = {...}: {
        settings = {
          wrapRc = false;
          unwrappedCfgPath = "${config.home.homeDirectory}/nixc/home/jakob/common/features/terminal/nixCats/dotfiles";
          aliases = ["tvim"];
        };

        categories = {
          general = true;
        };
      };
    };
  };
}
