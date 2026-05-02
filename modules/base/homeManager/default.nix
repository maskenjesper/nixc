{pkgs, ...}: {
  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = _: true;
  };

  home.packages = with pkgs; [
    nix-index
    appimage-run

    # CLI utilities
    lazygit
    zip
    unzip
    htop
    killall
    playerctl
    fastfetch
    lm_sensors
    hddtemp
    wget
    curl
    traceroute
  ];
}
