{
  inputs,
  ...
}: {
  flake.nixosModules.xremap = {pkgs, localUsers, ...}: {
    imports = [
      inputs.xremap.nixosModules.default
    ];

    services.xremap = {
      #withWlroots = true;
      #withHypr = true;
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
            application:
              not: Deadlock
      '';
    };

    environment.systemPackages = with pkgs; [
      # xremap needs these.
      wtype
      xremap
    ];

    # make xremap (and other software) able to bind keys
    hardware.uinput.enable = true;
    users.groups.uinput.members = localUsers;
    users.groups.input.members = localUsers;
  };
}