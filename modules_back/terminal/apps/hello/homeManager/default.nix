{config, ...}: {

    home.file.".hello-world" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixc/modules/terminal/apps/hello/homeManager/dotfiles";
    };

}
