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

  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.tuned.enable = true;
  services.upower.enable = true;

  environment.systemPackages = with pkgs; [

  ];
}
