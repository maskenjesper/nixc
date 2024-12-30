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

  # TODO: Refine this concept. Declare default true option for every global module.
  options.global.xremap = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      example = true;
      description = "Whether to enable this cool module.";
    };
    users = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
      example = ["username1" "username2"];
      description = "Users of this host.";
    };
  };

  config = lib.mkIf cfg.enable {
    services.xremap = {
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
        keymap:
          - name: main keymaps
            remap:
              C-KEY_SEMICOLON:
                launch: ["sudo", "wtype", "ö"]
              C-KEY_APOSTROPHE:
                launch: ["sudo", "wtype", "ä"]
              C-KEY_LEFTBRACE:
                launch: ["sudo", "wtype", "å"]
      '';
    };
    environment.systemPackages = with pkgs; [
      wtype
    ];
    hardware.uinput.enable = true;
    users.groups.uinput.members = cfg.users;
    users.groups.input.members = cfg.users;
  };
}
