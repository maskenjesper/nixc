{
  self,
  inputs,
  ...
}: {
  perSystem = {pkgs, ...}: {
    packages.neovim = inputs.wrapper-modules.wrappers.neovim.wrap {
      inherit pkgs;

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
        jinja-lsp
      ];

      settings.config_directory = ./.;
    };
  };
  # };
}
