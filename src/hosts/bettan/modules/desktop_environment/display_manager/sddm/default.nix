{pkgs, ...}: {
  # Setup sddm
  services.displayManager.sddm = {
    wayland.enable = true;
    enable = true;
    theme = "${import ./sddm-theme.nix {inherit pkgs;}}";
  };
}
