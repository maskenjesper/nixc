return {
    "stevearc/conform.nvim",
    even = { "BufReadPre", "BufNewFile" },
    config = function ()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                javascript = { "prettier" },
                lua = { "stylua" },
                python = { "isort", "black" },
                elixir = { "mix" },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            },
        })

        vim.keymap.set({"n", "v"}, "<leader>mp", function ()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            })
        end)
    end
}
