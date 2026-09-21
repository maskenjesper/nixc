{
  flake.nixosModules.keymap = {...}: {
    services.xserver.xkb = {
      layout = "us,se";
      variant = "";
      options = "grp:win_space_toggle";
    };
  };
}