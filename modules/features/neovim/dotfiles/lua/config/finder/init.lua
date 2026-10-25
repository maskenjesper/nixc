require("config.finder.flash")

local FzfLua = require("fzf-lua")
FzfLua.setup({ fzf_colors = true })

FzfLua.register_ui_select()

vim.keymap.set("n", "<leader>F", function()
    FzfLua.builtin()
end)
vim.keymap.set("n", "<leader>ff", function()
    FzfLua.files()
end)
vim.keymap.set("n", "<leader>fg", function()
    FzfLua.live_grep_native({
        actions = {
            ["ctrl-q"] = FzfLua.actions.file_sel_to_qf,
        },
    })
end)
vim.keymap.set("n", "<leader>fG", function()
    FzfLua.live_grep({
        resume = true,
    })
end)
vim.keymap.set("n", "<leader>fb", function()
    FzfLua.buffers()
end)
vim.keymap.set("n", "<leader>fr", function()
    FzfLua.resume()
end)
vim.keymap.set("n", "<leader>fm", function()
    FzfLua.marks()
end)
vim.keymap.set("n", "<leader>fh", function()
    FzfLua.helptags()
end)

vim.keymap.set("n", "<leader>flr", function()
    FzfLua.lsp_references()
end)
vim.keymap.set("n", "<leader>fld", function()
    FzfLua.lsp_document_symbols()
end)
vim.keymap.set("n", "<leader>flD", function()
    FzfLua.diagnostics_document()
end)
