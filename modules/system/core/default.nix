{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.system-core = {
    pkgs,
    lib,
    ...
  }: let
    modules = with self.nixosModules; [
      system-core-boot
      system-core-hardware
      system-core-locale
      system-core-nix_settings
      system-core-user
    ];
  in {
    imports = modules;
    services = {
      openssh.enable = true;
      avahi.enable = true;
    };
    environment.systemPackages = with pkgs; [
      vim
      unzip
      p7zip-rar
      usbutils
      lsof
      gvfs
      libnotify
      python315
      curlWithGnuTls
      wget
    ];
    system.stateVersion = "25.05";
  };
}
