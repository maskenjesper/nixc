{ pkgs, ... }: {
  flake.homeModules.git =
    { pkgs, ... }:
    let
      meld = "${pkgs.meld}/bin/meld";
      gitcomet = "${pkgs.gitcomet}/bin/gitcomet";
    in
    {
      programs.git = {
        enable = true;
        settings = {
          init.defaultBranch = "main ";
          user.name = "maskenjesper";
          user.email = "jakobolsson973@gmail.com";
          pull.rebase = false;
          diff.tool = gitcomet;
          merge.tool = gitcomet;
          difftool.prompt = false;
        };
      };
    };
}
