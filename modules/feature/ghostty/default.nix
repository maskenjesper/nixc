{
  flake.homeModules.ghostty = {pkgs, ...}: {
    home.file.".config/ghostty" = {
      source = ./dotfiles;
      recursive = true;
    };

    programs.ghostty = {
      enable = true;
      package =
        if pkgs.stdenv.isDarwin
        then pkgs.ghostty-bin
        else pkgs.ghostty;

      enableFishIntegration = true;

      settings = {
        # Custom shaders for a smooth cursor experience. Sourced from:
        # https://github.com/2501mau/term-bots/tree/main/shaders/cursor_smear_fade/glsl
        custom-shader = [
          "./shaders/cursor_smear_fade.glsl"
        ];
        font-size = 15;
        font-family = "Fira Code Nerd Font";
        background-opacity = "1.0";
        gtk-single-instance = true;
      };
    };
  };
}