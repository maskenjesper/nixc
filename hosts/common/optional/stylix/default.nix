{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];
  stylix = {
    enable = true;

    polarity = "dark";

    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord-light.yaml";

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };

    fonts = {
      monospace = {
        package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
        name = "JetBrainsMono Nerd Font Mono";
      };
      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };
    };
  };
}
