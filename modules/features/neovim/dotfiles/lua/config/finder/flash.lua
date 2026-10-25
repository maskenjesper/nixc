require("lze").load({
    "flash.nvim",
    after = function()
        local flash = require("flash")

        flash.setup({
            -- labels = "asdfjkl;",
        })

        vim.keymap.set({ "n", "x", "o" }, "s", function()
            flash.jump()
        end)
        vim.keymap.set({ "n", "x", "o" }, "S", function()
            flash.jump()
        end)
    end,
})
