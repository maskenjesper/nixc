require("lze").load({
	{
		"conform.nvim",
		-- cmd = { "" },
		-- event = "",
		-- ft = "",
		keys = {
			{ "<leader>FF", desc = "[F]ormat [F]ile" },
		},
		-- colorscheme = "",
		after = function(plugin)
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					-- NOTE: download some formatters in lspsAndRuntimeDeps
					-- and configure them here
					-- lua = { "stylua" },
					-- go = { "gofmt", "golint" },
					-- templ = { "templ" },
					-- Conform will run multiple formatters sequentially
					-- python = { "isort", "black" },
					-- Use a sub-list to run only the first available formatter
					-- javascript = { { "prettierd", "prettier" } },
					nix = { "alejandra" },
					lua = { "stylua" },
					bash = { "shfmt" },
					go = { "gofmt" },
				},
			})

			vim.api.nvim_create_autocmd("BufWritePre", {
				callback = function()
					conform.format({
						lsp_fallback = true,
						async = false,
						timeout_ms = 1000,
					})
				end,
			})

			vim.keymap.set({ "n", "v" }, "<leader>FF", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end, { desc = "[F]ormat [F]ile" })
		end,
	},
})
