{
  flake.nixosModules.hello = {pkgs, ...}: {
    environment.systemPackages = [ pkgs.hello ];
  };

  flake.homeModules.hello = {config, ...}: {
    home.file.".hello-world" = {
      source = ./dotfiles;
    };
  };
}