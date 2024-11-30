{pkgs, ...}: {
  services.openssh = {
    enable = true;
    ports = [30293];
    settings = {
      PasswordAuthentication = true;
      AllowUsers = ["jakob"];
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "no";
    };
  };
}
