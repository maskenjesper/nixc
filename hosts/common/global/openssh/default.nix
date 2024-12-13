{
  pkgs,
  ...
}: {
  ############################## Server ##############################
  services.openssh = {
    enable = false;
    ports = [30293];
    settings = {
      PasswordAuthentication = false;
      KbdInteractiveAuthentication = false;
      AllowUsers = ["jakob"];
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "no";
    };
  };

  services.fail2ban.enable = true;

  users.users.jakob.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIE1iJRI2a6lYCXYTSppETys2O2OlSBcMhugVYr3i76BE"
  ];

  ############################## Client ##############################
}
