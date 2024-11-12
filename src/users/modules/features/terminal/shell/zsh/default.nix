{pkgs, ...}: {
  home.file = {
    ".zshrc".source = ./.zshrc;
    ".p10k.zsh".source = ./.p10k.zsh;
  };
}
