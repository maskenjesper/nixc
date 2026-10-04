{
  self,
  inputs,
  ...
}: {
  perSystem = {pkgs, ...}: {
    packages.neovim = inputs.wrapper-modules.wrappers.neovim.wrap {
      inherit pkgs;

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
        pkgs.jinja-lsp
      ];

      settings.config_directory = ./.;
    };
  };
  # };
}
