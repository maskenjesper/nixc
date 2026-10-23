require("mini.surround").setup()


local MiniSnippets = require("mini.snippets")
MiniSnippets.setup({
    snippets = {
        MiniSnippets.gen_loader.from_lang(), -- loads friendy-snippets automatically
    },
})
MiniSnippets.start_lsp_server({ match = false })

local MiniAnimate = require("mini.animate")
MiniAnimate.setup({
    cursor = {
        enable = false,
    },
    scroll = {

        enable = true,
    },
    resize = {

        enable = false,
    },
    open = {

        enable = false,
    },
    close = {
        enable = false,
    },
})
