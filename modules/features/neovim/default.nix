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
          csharp-ls
          kdePackages.qtdeclarative
          openscad-lsp
          arduino-language-server
          clang
          clang-tools
          cmake-language-server
          cmake-format
          cmake-lint
          nginx-language-server
          htmx-lsp2
        ];

        startupPlugins.general = with pkgs.vimPlugins; [
          lze
          oil-nvim
          vim-repeat
          plenary-nvim
          nvim-web-devicons
          nvim-lspconfig
          markview-nvim
          gruvbox-nvim
          kanagawa-nvim
          neoscroll-nvim
        ];

        optionalPlugins.general = with pkgs.vimPlugins; [
          cmake-tools-nvim
          vim-fugitive
          gitsigns-nvim
          indent-o-matic
          zen-mode-nvim
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
          dressing-nvim
          comment-nvim
          harpoon
          vim-tmux-navigator
          lualine-nvim
          nvim-tree-lua
          nvim-lint
          nvim-dap
          nvim-dap-ui
          nvim-dap-virtual-text
          conform-nvim
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

        # nixCats = {pkgs, ...}:
        #   if !config.dotfiles.mutable
        #   then {
        #     settings = {
        #       aliases = ["nvim"];
        #     };
        #
        #     categories = {
        #       general = true;
        #       elixirlspath = "${pkgs.elixir-ls}/lib/language-server.sh";
        #     };
        #   }
        #   else {
        #     settings = {
        #       wrapRc = false;
        #       unwrappedCfgPath = "${config.home.homeDirectory}/nixc/modules/features/neovim/dotfiles";
        #       aliases = ["nvim"];
        #     };
        #
        #     categories = {
        #       general = true;
        #       elixirlspath = "${pkgs.elixir-ls}/lib/language-server.sh";
        #     };
        #   };

        # nixCats = if !config.dotfiles.mutable
        # then ({pkgs, ...}: {
        #     settings = {
        #       aliases = ["nvim"];
        #     };
        #
        #     categories = {
        #       general = true;
        #       elixirlspath = "${pkgs.elixir-ls}/lib/language-server.sh";
        #     };
        #   };)
        # else
        #   ({pkgs, ...}: {
        #     settings = {
        #       wrapRc = false;
        #       unwrappedCfgPath = "${config.home.homeDirectory}/nixc/modules/terminal/apps/nixCats/homeManager/dotfiles";
        #       aliases = ["nvim"];
        #     };
        #
        #     categories = {
        #       general = true;
        #       elixirlspath = "${pkgs.elixir-ls}/lib/language-server.sh";
        #     };
        #   };);

        # nixCats = {pkgs, ...}: {
        #   settings = {
        #     aliases = ["nvim"];
        #   };
        #
        #   categories = {
        #     general = true;
        #     elixirlspath = "${pkgs.elixir-ls}/lib/language-server.sh";
        #   };
        # };
        # testCats = {pkgs, ...}: {
        #   settings = {
        #     wrapRc = false;
        #     unwrappedCfgPath = "${config.home.homeDirectory}/nixc/modules/terminal/apps/nixCats/homeManager/dotfiles";
        #     aliases = ["nvim"];
        #   };
        #
        #   categories = {
        #     general = true;
        #     elixirlspath = "${pkgs.elixir-ls}/lib/language-server.sh";
        #   };
        # };
      };
    };
  };

  flake.nixosModules.neovim = moduleWithSystem (
    {self'}: {
      environment.systemPackages = with self'.packages; [
        neovim
      ];
    }
  );

  perSystem = {pkgs, ...}: let
    runtimePkgs = with pkgs; [
      universal-ctags
      ripgrep
      fd
      zoxide
      fzf
      fish-lsp
      gopls
      gotools
      go-tools
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
      csharp-ls
      kdePackages.qtdeclarative
      openscad-lsp
      arduino-language-server
      clang
      clang-tools
      cmake-language-server
      cmake-format
      cmake-lint
      nginx-language-server
      htmx-lsp2
    ];

    startupPlugins = with pkgs.vimPlugins; [
      lze
      oil-nvim
      vim-repeat
      plenary-nvim
      nvim-web-devicons
      nvim-lspconfig
      markview-nvim
      gruvbox-nvim
      kanagawa-nvim
      neoscroll-nvim
    ];

    optionalPlugins = with pkgs.vimPlugins; [
      cmake-tools-nvim
      vim-fugitive
      gitsigns-nvim
      indent-o-matic
      zen-mode-nvim
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
      dressing-nvim
      comment-nvim
      harpoon
      vim-tmux-navigator
      lualine-nvim
      nvim-tree-lua
      nvim-lint
      nvim-dap
      nvim-dap-ui
      nvim-dap-virtual-text
      conform-nvim
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
