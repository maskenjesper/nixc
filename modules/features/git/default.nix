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
        difftool.prompt = false;

        core = {
          pager = delta;
        };
        interactive = {
          diffFilter = "${delta} --color-only";
        };
        delta = {
          navigate = true;
          dark = true;
        };
        merge = {
          conflictstyle = "zdiff3";
        };
      };
    };
  };
}
