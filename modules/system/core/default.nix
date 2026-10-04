{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.core = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
      self.nixosModules.boot
      self.nixosModules.hardware
      self.nixosModules.locale
      self.nixosModules.nix_settings
      self.nixosModules.user
    ];
    services = {
      openssh.enable = true;
      avahi.enable = true;
    };
    environment.systemPackages = [
      pkgs.vim
      pkgs.unzip
      pkgs.p7zip-rar
      pkgs.usbutils
      pkgs.lsof
      pkgs.gvfs
      pkgs.libnotify
      #dont know if I want this on the system-level
      #python315
      pkgs.curlWithGnuTls
      pkgs.wget
    ];
    system.stateVersion = "25.05";
  };
}
