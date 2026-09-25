{
  flake.nixosModules.ssh = {
    lib,
    config,
    ...
  }: let
    cfg = config.ssh;
  in {
    options.ssh = {
      enable = lib.mkEnableOption "enables ssh";
    };

    config = lib.mkIf cfg.enable {
      # Enable the OpenSSH daemon.
      services.openssh = {
        enable = true;
        ports = [6845];
        settings = {
          PasswordAuthentication = false;
          KbdInteractiveAuthentication = false;
          PermitRootLogin = "no";
          AllowUsers = ["jakob"];
        };
      };

      # Ban connections that fail authentication 5 times.
      services.fail2ban.enable = true;
    };
  };
}
