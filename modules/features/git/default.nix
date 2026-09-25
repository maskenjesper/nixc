{pkgs, ...}: {
  flake.homeModules.git = {pkgs, ...}: {
    programs.git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
        user.name = "maskenjesper";
        user.email = "jakobolsson973@gmail.com";
        pull.rebase = false;
      };
    };
  };
}
