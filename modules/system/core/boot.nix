{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.boot = {
    pkgs,
    lib,
    config,
    ...
  }: {
    imports = [];
    boot = {
      loader = {
        timeout = 10;
        efi = {
          canTouchEfiVariables = true;
        };
        grub = {
          efiSupport = true;
          device = "nodev";
          theme = pkgs.catppuccin-grub;
        };
        # systemd-boot.enable = true;
      };

      # What is plymouth? It's a graphical boot splash screen manager that hides the kernel messages during boot.
      plymouth = {
        enable = true;
        theme = "catppuccin-mocha";
        themePackages = with pkgs; [
          # By default we would install all themes
          (catppuccin-plymouth.override {
            variant = "mocha";
          })
        ];
      };

      ### KERNEL ###
      kernelPackages = pkgs.linuxPackages_latest;
      # If using extra kernel modules, they should be selected from the module set for the kernel version configured above.
      extraModulePackages = with config.boot.kernelPackages; [];
    };
  };
}
