{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.user = {
    pkgs,
    lib,
    ...
  }: {
    imports = [
    ];
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
