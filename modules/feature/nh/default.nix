{lib, ...}: {
  flake.nixosModules.nh = {
    pkgs,
    config,
    ...
  }: {
    options.nh = {
      enable = lib.mkEnableOption "enables nh";
      flakePath = lib.mkOption {
        default = "/home/jakob/nixc";
        type = lib.types.singleLineStr;
      };
    };

    config = lib.mkIf config.nh.enable {
      environment.sessionVariables.NH_FLAKE = config.nh.flakePath;

      environment.systemPackages = with pkgs; [
        nh
      ];
    };
  };
}
