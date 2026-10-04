{
  flake.nixosModules.nautilus = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.nautilus
    ];

    services.gvfs.enable = true;

    nixpkgs.overlays = [
      (final: prev: {
        nautilus = prev.nautilus.overrideAttrs (nprev: {
          buildInputs =
            nprev.buildInputs
            ++ [
              pkgs.gst_all_1.gst-plugins-good
              pkgs.gst_all_1.gst-plugins-bad
            ];
        });
      })
    ];
  };
}
