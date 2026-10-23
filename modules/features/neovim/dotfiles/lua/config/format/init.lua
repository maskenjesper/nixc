require("lze").load({
    "conform.nvim",
    keys = {
        { "<leader>FF", desc = "[F]ormat [F]ile" },
    },
    event = "BufWritePre",
    after = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                nix = { "alejandra" },
                lua = { "stylua" },
                cpp = { "clang-format" },
                cmake = { "cmake-format" },
            },
            formatters = {
                stylua = {
                    prepend_args = { "--indent-type", "Spaces", "--indent-width", "4" },
                },
                clang_format = {
                    prepend_args = { "--style={UseTab: Never, IndentWidth: 4, TabWidth: 4}" },
                },
                cmake_format = {
                    prepend_args = { "--tab-size", "4" },
                },
            },
            format_on_save = {
                lsp_format = "fallback",
                timeout_ms = 500,
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>FF", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 1000,
            })
        end, { desc = "[F]ormat [F]ile" })
    end,
})
