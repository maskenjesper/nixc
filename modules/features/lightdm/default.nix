{
  flake.nixosModules.lightdm = {pkgs, ...}: {
    services.xserver = {
      enable = true;

      xrandrHeads = [
        {
          output = "DP-1";
          primary = true;
        }
      ];  

      displayManager.lightdm = {
        enable = true;

        greeters.slick = {
          enable = true;
        };
      };
    };
  };
}
