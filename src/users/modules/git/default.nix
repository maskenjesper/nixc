{pkgs, ...}: {
  programs.git = {
    enable = true;
    userName = "jakob";
    userEmail = "noreply@email.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
  programs.gh.enable = true;
  programs.lazygit.enable = true;
}
