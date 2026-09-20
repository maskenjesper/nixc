{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.saturnConfiguration = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      self.nixosModules.saturnHardware
      self.nixosModules.niri
    ];

    networking.hostName = "saturn"; # Define your hostname.

    programs = {
      fish.enable = true;
      nh = {
        enable = true;
        clean.enable = true;
        clean.extraArgs = "--keep-since 4d --keep 3";
        # TODO how do I not hardcode this
        flake = "/home/jakob/nixc"; # sets NH_OS_FLAKE variable for you
      };
    };

    environment.systemPackages = with pkgs; [
      # Avoid adding packages here.
    ];

    users.users.jakob = {
      isNormalUser = true;
      shell = pkgs.fish;
      description = "Jakob Olsson";
      extraGroups = ["networkmanager" "wheel" "dialout"];
      packages = [
        pkgs.home-manager
      ];
    };

    nixpkgs.config.allowUnfree = true;

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Europe/Stockholm";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "sv_SE.UTF-8";
      LC_IDENTIFICATION = "sv_SE.UTF-8";
      LC_MEASUREMENT = "sv_SE.UTF-8";
      LC_MONETARY = "sv_SE.UTF-8";
      LC_NAME = "sv_SE.UTF-8";
      LC_NUMERIC = "sv_SE.UTF-8";
      LC_PAPER = "sv_SE.UTF-8";
      LC_TELEPHONE = "sv_SE.UTF-8";
      LC_TIME = "sv_SE.UTF-8";
    };

    # Use flakes
    nix.settings = {
      experimental-features = ["nix-command" "flakes"];

      download-buffer-size = 1048576000; # 1GB
      auto-optimise-store = true;
    };
  };
}
