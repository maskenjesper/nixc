{
  pkgs,
  inputs,
  config,
  lib,
  ...
}: let
  cfg = config.global.xremap;
in {
  imports = [
    inputs.xremap.nixosModules.default
  ];

  options.global.xremap = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = true;
      description = "Whether to enable this cool module.";
    };
  };

  config = lib.mkIf cfg.enable {
    services.xremap = {
      userName = "jakob";
      withWlroots = true;
      watch = true;
      yamlConfig = ''
        modmap:
          - name: main remaps
            remap:
              CapsLock:
                held: leftctrl
                alone: esc
                alone_timeout_millis: 250
              esc: CapsLock
      '';
    };
    hardware.uinput.enable = true;
    users.groups.uinput.members = ["jakob"];
    users.groups.input.members = ["jakob"];
  };
}
