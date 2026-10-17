{lib, ...}: {
  options.dotfiles.mutable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Use live, out-of-store configuration.";
  };

  config = {
    dotfiles.mutable = true; # This toggles live-editing setting on the flake-parts level as opposed to the below home manager option that does the same but in a home-manager context. This setting can instead be used outside of home manager modules like a perSystem definition (see neovim).

    flake.homeModules.dotfiles = {
      config,
      lib,
      ...
    }: {
      options = {
        dotfiles = {
          mutable = lib.mkEnableOption "mutable dotfiles";

          path = lib.mkOption {
            type = lib.types.path;
            apply = toString;
            default = "${config.home.homeDirectory}/workspace/nix-config/home";
            example = "${config.home.homeDirectory}/.dotfiles";
            description = "Location of the dotfiles working copy";
          };
        };
      };
    };
  };
}
