{...}: {
  flake.nixosModules.amd-gpu = {pkgs, ...}: {
    environment.systemPackages = [
      pkgs.mesa
      pkgs.rocmPackages.rocm-smi
      pkgs.rocmPackages.rocminfo
      pkgs.vulkan-tools
    ];
    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = [
          pkgs.libva-vdpau-driver
          pkgs.libvdpau-va-gl
          pkgs.rocmPackages.clr.icd
        ];
      };
      amdgpu = {
        initrd.enable = true;
        opencl.enable = true;
      };
    };

    boot.initrd.kernelModules = ["amdgpu"];
    boot.kernelParams = [
      "amdgpu.ppfeaturemask=0xffffffff"
    ];

    services.xserver = {
      videoDrivers = ["amdgpu"];
      enable = true;
    };

    # For rOCM
    systemd.tmpfiles.rules = [
      "L+ /opt/rocm - - - - ${pkgs.rocmPackages.clr}"
    ];
  };
}
