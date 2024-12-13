return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000, -- Load before others
	config = function() -- config function will run whenever the plugin loads
		-- Load the colorscheme when the plugin loads
		vim.cmd([[colorscheme gruvbox]]) -- Execute a vim cmd (like typing commands with ":")
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}
