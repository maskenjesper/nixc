{
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    wireguard-ui
    wireguard-tools
  ];

  # networking = {
  #   nat = {
  #     enable = true;
  #     externalInterface = "eth0";
  #     internalInterfaces = ["wg0"];
  #   };
  #   firewall = {
  #     allowedUDPPorts = [51820];
  #   };
  #
  #   wireguard.interfaces = {
  #     wg0 = {
  #       ips = ["192.168.1.150/24"];
  #
  #       listenPort = 51820;
  #
  #       postSetup = ''
  #         ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o eth0 -j MASQUERADE
  #       '';
  #
  #       postShutdown = ''
  #         ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -s 192.168.1.0/24 -o eth0 -j MASQUERADE
  #       '';
  #
  #       privateKeyFile = "/home/${user}/wireguard-keys/private";
  #
  #       peers = [
  #         { # pixel-phone
  #           publicKey = "ZRS+MR+40w0n/H0zrzdtdU3gUxA47+/c36cVSxy9gnU=";
  #           allowedIPs = ["192.168.1.151/32"];
  #         }
  #       ];
  #     };
  #   };
  # };
}
