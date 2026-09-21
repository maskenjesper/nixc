{
  flake.nixosModules.virtualization = {pkgs, ...}: {
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
  };
}