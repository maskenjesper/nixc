{
  inputs,
  moduleWithSystem,
  ...
}: {
  flake.homeModules.neovim = {config, ...}: {
    imports = [
      inputs.nixCats.homeModule
    ];

    nixCats = {
      enable = true;
      nixpkgs_version = inputs.nixpkgs;
      addOverlays = [
        (inputs.nixCats.utils.standardPluginOverlay inputs)
      ];
      packageNames = ["nixCats"];

      luaPath = "${./dotfiles}";

      categoryDefinitions.replace = {pkgs, ...} @ packageDef: {
        lspsAndRuntimeDeps.general = [
          pkgs.universal-ctags
          pkgs.ripgrep
          pkgs.fd
          pkgs.zoxide
          pkgs.fzf
          pkgs.fish-lsp
          pkgs.gopls
          pkgs.gotools
          pkgs.go-tools
          pkgs.bash-language-server
          pkgs.shfmt
          pkgs.nix-doc
          pkgs.nixd
          pkgs.nixfmt
          pkgs.lua-language-server
          pkgs.stylua
          pkgs.elixir-ls
          pkgs.dart
          pkgs.yamlfmt
          pkgs.yaml-language-server
          pkgs.hyprls
          pkgs.csharp-ls
          pkgs.kdePackages.qtdeclarative
          pkgs.openscad-lsp
          pkgs.arduino-language-server
          pkgs.clang
          pkgs.clang-tools
          pkgs.cmake-language-server
          pkgs.cmake-format
          pkgs.cmake-lint
          pkgs.nginx-language-server
          pkgs.htmx-lsp2
          pkgs.jinja-lsp
        ];

        startupPlugins.general = [
          pkgs.vimPlugins.lze
          pkgs.vimPlugins.oil-nvim
          pkgs.vimPlugins.vim-repeat
          pkgs.vimPlugins.plenary-nvim
          pkgs.vimPlugins.nvim-web-devicons
          pkgs.vimPlugins.nvim-lspconfig
          pkgs.vimPlugins.markview-nvim
          pkgs.vimPlugins.gruvbox-nvim
          pkgs.vimPlugins.kanagawa-nvim
          pkgs.vimPlugins.neoscroll-nvim
        ];

        optionalPlugins.general = [
          pkgs.vimPlugins.cmake-tools-nvim
          pkgs.vimPlugins.vim-fugitive
          pkgs.vimPlugins.gitsigns-nvim
          pkgs.vimPlugins.indent-o-matic
          pkgs.vimPlugins.zen-mode-nvim
          pkgs.vimPlugins.hologram-nvim
          pkgs.vimPlugins.indent-blankline-nvim
          pkgs.vimPlugins.obsidian-nvim
          pkgs.vimPlugins.telescope-fzf-native-nvim
          pkgs.vimPlugins.telescope-ui-select-nvim
          pkgs.vimPlugins.telescope-nvim
          pkgs.vimPlugins.snacks-nvim
          pkgs.vimPlugins.nvim-cmp
          pkgs.vimPlugins.luasnip
          pkgs.vimPlugins.friendly-snippets
          pkgs.vimPlugins.cmp_luasnip
          pkgs.vimPlugins.cmp-buffer
          pkgs.vimPlugins.cmp-path
          pkgs.vimPlugins.cmp-nvim-lua
          pkgs.vimPlugins.cmp-nvim-lsp
          pkgs.vimPlugins.cmp-cmdline
          pkgs.vimPlugins.cmp-nvim-lsp-signature-help
          pkgs.vimPlugins.cmp-cmdline-history
          pkgs.vimPlugins.lspkind-nvim
          pkgs.vimPlugins.nvim-treesitter-textobjects
          pkgs.vimPlugins.nvim-treesitter.withAllGrammars
          pkgs.vimPlugins.which-key-nvim
          pkgs.vimPlugins.dressing-nvim
          pkgs.vimPlugins.comment-nvim
          pkgs.vimPlugins.harpoon
          pkgs.vimPlugins.vim-tmux-navigator
          pkgs.vimPlugins.lualine-nvim
          pkgs.vimPlugins.nvim-tree-lua
          pkgs.vimPlugins.nvim-lint
          pkgs.vimPlugins.nvim-dap
          pkgs.vimPlugins.nvim-dap-ui
          pkgs.vimPlugins.nvim-dap-virtual-text
          pkgs.vimPlugins.conform-nvim
        ];

        environmentVariables.general = {
          ELIXIRLS = "${pkgs.elixir-ls}/lib/language-server.sh";
        };
      };

      packageDefinitions.replace = {
        nixCats = {pkgs, ...}: {
          settings =
            {
              aliases = ["nvim"];
            }
            // (
              if !config.dotfiles.mutable
              then {}
              else {
                wrapRc = false;
                unwrappedCfgPath = "${config.home.homeDirectory}/nixc/modules/features/neovim/dotfiles";
              }
            );

          categories = {
            general = true;
            elixirlspath = "${pkgs.elixir-ls}/lib/language-server.sh";
          };
        };
      };
    };
  };

  flake.nixosModules.neovim = moduleWithSystem (
    {self'}: {
      environment.systemPackages = [
        self'.packages.neovim
      ];
    }
  );

  perSystem = {pkgs, ...}: let
    runtimePkgs = [
      pkgs.universal-ctags
      pkgs.ripgrep
      pkgs.fd
      pkgs.zoxide
      pkgs.fzf
      pkgs.fish-lsp
      pkgs.gopls
      pkgs.gotools
      pkgs.go-tools
      pkgs.bash-language-server
      pkgs.shfmt
      pkgs.nix-doc
      pkgs.nixd
      pkgs.alejandra
      pkgs.lua-language-server
      pkgs.stylua
      pkgs.elixir-ls
      pkgs.dart
      pkgs.yamlfmt
      pkgs.yaml-language-server
      pkgs.hyprls
      pkgs.csharp-ls
      pkgs.kdePackages.qtdeclarative
      pkgs.openscad-lsp
      pkgs.arduino-language-server
      pkgs.clang
      pkgs.clang-tools
      pkgs.cmake-language-server
      pkgs.cmake-format
      pkgs.cmake-lint
      pkgs.nginx-language-server
      pkgs.htmx-lsp2
    ];

    startupPlugins = [
      pkgs.vimPlugins.lze
      pkgs.vimPlugins.oil-nvim
      pkgs.vimPlugins.vim-repeat
      pkgs.vimPlugins.plenary-nvim
      pkgs.vimPlugins.nvim-web-devicons
      pkgs.vimPlugins.nvim-lspconfig
      pkgs.vimPlugins.markview-nvim
      pkgs.vimPlugins.gruvbox-nvim
      pkgs.vimPlugins.kanagawa-nvim
      pkgs.vimPlugins.neoscroll-nvim
    ];

    optionalPlugins = [
      pkgs.vimPlugins.cmake-tools-nvim
      pkgs.vimPlugins.vim-fugitive
      pkgs.vimPlugins.gitsigns-nvim
      pkgs.vimPlugins.indent-o-matic
      pkgs.vimPlugins.zen-mode-nvim
      pkgs.vimPlugins.hologram-nvim
      pkgs.vimPlugins.indent-blankline-nvim
      pkgs.vimPlugins.obsidian-nvim
      pkgs.vimPlugins.telescope-fzf-native-nvim
      pkgs.vimPlugins.telescope-ui-select-nvim
      pkgs.vimPlugins.telescope-nvim
      pkgs.vimPlugins.snacks-nvim
      pkgs.vimPlugins.nvim-cmp
      pkgs.vimPlugins.luasnip
      pkgs.vimPlugins.friendly-snippets
      pkgs.vimPlugins.cmp_luasnip
      pkgs.vimPlugins.cmp-buffer
      pkgs.vimPlugins.cmp-path
      pkgs.vimPlugins.cmp-nvim-lua
      pkgs.vimPlugins.cmp-nvim-lsp
      pkgs.vimPlugins.cmp-cmdline
      pkgs.vimPlugins.cmp-nvim-lsp-signature-help
      pkgs.vimPlugins.cmp-cmdline-history
      pkgs.vimPlugins.lspkind-nvim
      pkgs.vimPlugins.nvim-treesitter-textobjects
      pkgs.vimPlugins.nvim-treesitter.withAllGrammars
      pkgs.vimPlugins.which-key-nvim
      pkgs.vimPlugins.dressing-nvim
      pkgs.vimPlugins.comment-nvim
      pkgs.vimPlugins.harpoon
      pkgs.vimPlugins.vim-tmux-navigator
      pkgs.vimPlugins.lualine-nvim
      pkgs.vimPlugins.nvim-tree-lua
      pkgs.vimPlugins.nvim-lint
      pkgs.vimPlugins.nvim-dap
      pkgs.vimPlugins.nvim-dap-ui
      pkgs.vimPlugins.nvim-dap-virtual-text
      pkgs.vimPlugins.conform-nvim
    ];
  in {
    packages.neovim = inputs.wrapper-modules.wrappers.neovim.wrap {
      inherit pkgs;
      env = {
        "CONFIG_ROOT" = ./.;
        "NVIM_APPNAME" = "neovim";
      };
      runtimePkgs = runtimePkgs;

      specs.general = startupPlugins;
      specs.lazy = {
        lazy = true;
        data = optionalPlugins;
      };

      settings.config_directory = ./.;
    };
  };
}
