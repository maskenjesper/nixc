{pkgs, ...}: {
  fonts.packages = with pkgs; [
    # (nerdfonts.override {fonts = ["JetBrainsMono"];})
    font-awesome_6
    noto-fonts-extra
    nerdfonts
  ];
}
