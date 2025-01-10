{pkgs, ...}: {
  users.users.jakob = {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "Jakob Olsson";
    extraGroups = ["networkmanager" "wheel"];
    packages = [
      pkgs.home-manager
    ];
  };
  programs.fish.enable = true;

  programs._1password-gui = {
    enable = true;
    polkitPolicyOwners = ["jakob"];
  };
}
