{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Tools
    dbeaver-bin
    gnumake

    # Languages
    elixir
    erlang

    # LSPs
    nixd # Nix
    lua-language-server # Lua
    elixir-ls

    # Code formatters
    alejandra # Nix
    stylua # Lua
    shellcheck # bash
  ];
}
