{
  pkgs,
  ...
}: {
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
  users.users.jakob.extraGroups = ["docker"];

  environment.systemPackages = with pkgs; [
    docker-compose
  ];
}
