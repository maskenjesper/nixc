{ pkgs, ... }: {
  flake.homeModules.git =
    { pkgs, ... }:
    let
      meld = "${pkgs.meld}/bin/meld";
    in
    {
      programs.git = {
        enable = true;
        settings = {
          init.defaultBranch = "main ";
          user.name = "maskenjesper";
          user.email = "jakobolsson973@gmail.com";
          pull.rebase = false;
          diff.tool = meld;
          merge.tool = meld;
          difftool.prompt = false;
        };
      };
    };
}
