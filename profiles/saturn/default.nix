{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/base/nixos
    
    ../../modules/desktop-environments/niri/nixos
    ../../modules/desktop-environments/noctalia/nixos
  ];

  networking.hostName = "saturn"; # Define your hostname.

  nix.settings.download-buffer-size = 1048576000; # 1GB

  #services.displayManager.gdm.enable = true;
  #services.desktopManager.gnome.enable = true;

  users.users.jakob = {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "Jakob Olsson";
    extraGroups = ["networkmanager" "wheel" "dialout"];
    packages = [
      pkgs.home-manager
    ];
  };
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    # Avoid adding packages here.
  ];

  system.stateVersion = "24.05";
}
