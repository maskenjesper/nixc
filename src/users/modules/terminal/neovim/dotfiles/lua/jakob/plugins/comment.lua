-- Only binding this plugin provides that I need to know is `gc` when in visual mode which comments out the selected text.
return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = true -- runs require('Comment').setup()
}
