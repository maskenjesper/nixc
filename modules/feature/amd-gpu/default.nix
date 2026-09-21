{
  flake.nixosModules.amd-gpu = {pkgs, config, ...}: {
    environment.systemPackages = with pkgs; [
      clinfo
      lact
    ];

    boot.initrd.kernelModules = ["amdgpu"];

    services.xserver = {
      videoDrivers = ["amdgpu"];
      enable = true;
    };

    # LACT (video card overclocking and control)
    systemd = {
      tmpfiles.rules = [
        "L+    /opt/rocm/hip   -   -   -   -   ${pkgs.rocmPackages.clr}"
      ];
      packages = with pkgs; [lact];
      services.lactd.wantedBy = ["multi-user.target"];
    };

    hardware.graphics = {
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
      ];
      extraPackages32 = with pkgs; [];
      enable32Bit = true;
    };
  };
}