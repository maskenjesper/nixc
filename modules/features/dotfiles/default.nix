{lib, ...}: {
  options.dotfiles.mutable = lib.mkOption {
    type = lib.types.bool;
    default = false;
    description = "Use live, out-of-store configuration.";
  };

  config = {
    dotfiles.mutable = true;

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
