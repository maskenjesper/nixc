{pkgs, ...}: {
  flake.homeModules.git = {pkgs, ...}: let
    meld = "${pkgs.meld}/bin/meld";
    delta = "${pkgs.delta}/bin/delta";
  in {
    programs.git = {
      enable = true;
      settings = {
        init.defaultBranch = "main ";
        user.name = "maskenjesper";
        user.email = "jakobolsson973@gmail.com";
        pull.rebase = false;
        diff.tool = delta;
        merge.tool = delta;
        difftool.prompt = false;
      };
    };
  };
}
