{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.xremap-flake.nixosModules.default
  ];

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
              alone_timeout_millis: 150
            esc: CapsLock
    '';
  };
  hardware.uinput.enable = true;
  users.groups.uinput.members = ["jakob"];
  users.groups.input.members = ["jakob"];
}
