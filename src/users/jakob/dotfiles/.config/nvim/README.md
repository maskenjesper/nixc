# Structure

nvim/
    init.lua
    lazy-lock.lua
    lua/
        jakob/
            lazy.lua
            core/
                init.lua
                keymaps.lua
                options.lua

nvim requires the nvim folder when it loads. When lua requires a folder and it
contains an init.lua file, that file will be executed. We therefore place init.lua
in this directory which becomes our entry point into our configuration.

This file in turn, require the jakob.core and jakob.lazy modules. The module names start from the "lua" folder in the same directrory as init.lua. The jakob.core module contains vanilla configs keymaps and options which. 

The lazy.lua file installs the package manager lazy.nvim and loads it.
