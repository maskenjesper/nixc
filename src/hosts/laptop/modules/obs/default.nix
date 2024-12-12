{pkgs, ...}: {
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;

    plugins = []; # default
    package = pkgs.obs-studio; # default
  };
}
