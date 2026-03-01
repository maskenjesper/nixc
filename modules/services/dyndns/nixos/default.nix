{
  config,
  pkgs,
  ...
}: let
  hostupUpdate = pkgs.writeShellScript "hostup-ddns-update" ''
    ${pkgs.curl}/bin/curl -fsS "https://cloud.hostup.se/api/dyndns/update?hostname=maskenjesper.se&token=0d464d3a4f86126991105c2cc180a92131e3042bdebd2758fb862f2daa443ec9"
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
