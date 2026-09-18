{
  pkgs,
  lib,
  config,
  inputs,
  ...
}: {
  imports = [
    #../../common/nixos
    inputs.noctalia.nixosModules.default
  ];

  
  programs.noctalia = {
    enable = true;
    systemd.enable = true;
  };

    environment.systemPackages = with pkgs; [
    ];
}
