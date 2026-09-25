{
  inputs,
  moduleWithSystem,
  ...
}: {
  flake.homeModules.kitty = {
    config,
    pkgs,
    ...
  }: {
    home.file.".config/kitty" = {
      source =
        if !config.dotfiles.mutable
        then ./dotfiles
        else config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/modules/features/gh/dotfiles";
    };

    home.packages = [pkgs.kitty];
  };
  # flake.homeModules.kitty = {pkgs, ...}: {
  #   programs.kitty = {
  #     enable = true;
  #     settings = {
  #       confirm_os_window_close = 0;
  #       dynamic_background_opacity = true;
  #       enable_audio_bell = false;
  #       mouse_hide_wait = "-1.0";
  #       window_padding_width = 0;
  #       background_obacity = "0.9";
  #       background_blur = 5;
  #       cursor_trail = 1;
  #       font_family = "Fira Code";
  #       font_size = 15;
  #     };
  #   };
  # };
  #
  # flake.nixosModules.kitty = moduleWithSystem (
  #   {self'}: {
  #     environment.systemPackages = with self'.packages; [
  #       kitty
  #     ];
  #   }
  # );
  # perSystem = {pkgs, ...}: {
  #   packages.kitty = let
  #     fira-mono = pkgs.nerd-fonts.fira-mono;
  #     fontsConf = pkgs.makeFontsConf {
  #       fontDirectories = [fira-mono];
  #     };
  #   in
  #     inputs.wrapper-modules.wrappers.kitty.wrap {
  #       inherit pkgs;
  #       environment = {
  #         "FONTCONFIG_FILE" = "${fontsConf}";
  #       };
  #       font = {
  #         name = "FiraMono Nerd Font Mono";
  #         size = 11;
  #       };
  #       settings = {
  #         font_size = 11;
  #         scrollbar = "never";
  #         pixel_scroll = false;
  #         window_padding_width = 9;
  #         background_opacity = 0.50;
  #         confirm_os_window_close = 0;
  #         enable_audio_bell = false;
  #         cursor_trail = 1;
  #         cursor_trail_start_threshold = 1;
  #         cursor_trail_color = "#cba6f7";
  #         cursor_shape = "beam";
  #         allow_remote_control = true;
  #       };
  #       keybindings = {
  #         "ctrl+backspace" = "send_text all \\x17";
  #       };
  #       themeFile = "Catppuccin-Mocha";
  #     };
  # };
}
