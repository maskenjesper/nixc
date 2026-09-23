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
    imports = with self.nixosModules; [
      boot
      hardware
      locale
      nix_settings
      user
    ];
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
