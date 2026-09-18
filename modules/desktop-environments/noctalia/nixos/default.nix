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
  };

    environment.systemPackages = with pkgs; [
    ];
}
