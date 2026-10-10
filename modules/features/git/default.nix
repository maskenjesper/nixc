{ pkgs, ... }: {
  flake.homeModules.git =
    { pkgs, ... }:
    let
      meld = "${pkgs.meld}/bin/meld";
      gitcomet = "${pkgs.gitcomet}/bin/gitcomet";
      neovim = "${pkgs.neovim}/bin/neovim";
    in
    {
      programs.git = {
        enable = true;
        settings = {
          init.defaultBranch = "main ";
          user.name = "maskenjesper";
          user.email = "jakobolsson973@gmail.com";
          pull.rebase = false;
          diff.tool = neovim;
          merge.tool = neovim;
          difftool.prompt = false;
        };
      };
    };
}
