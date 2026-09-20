{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.system-core-user = {
    pkgs,
    lib,
    ...
  }: let
    modules = with self.nixosModules; [
    ];
  in {
    imports = modules;
    programs.fish.enable = true;
    users.users.jakob = {
      isNormalUser = true;
      initialPassword = "qwer";
      shell = pkgs.fish;
      description = "jakob";
      extraGroups = [
        "root"
        "wheel"
      ];
    };
  };
}
