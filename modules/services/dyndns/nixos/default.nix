{
  config,
  pkgs,
  ...
}: let
  hostupUpdate = pkgs.writeShellScript "hostup-ddns-update" ''
    source ${config.age.secrets.secret1.path}
    ${pkgs.curl}/bin/curl -fsS "https://cloud.hostup.se/api/dyndns/update?hostname=maskenjesper.se&token=$HOSTUP_TOKEN"
  '';
in {
  systemd.services.hostup-ddns = {
    description = "Hostup DDNS Update";
    serviceConfig = {
      Type = "oneshot";
      ExecStart = hostupUpdate;
    };
  };

  systemd.timers.hostup-ddns = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnBootSec = "2min";
      OnUnitActiveSec = "5min";
    };
  };
}
