# WORK IN PROGRESS....
{
  flake.nixosModules.greetd = {pkgs, ...}: {

    programs.regreet.enable = true;

    services.greetd = {
      enable = true;

      settings = {
        default_session = {
          command = "${pkgs.regreet}/bin/regreet";
          user = "greeter";
        };
      };
    };
  };
}
