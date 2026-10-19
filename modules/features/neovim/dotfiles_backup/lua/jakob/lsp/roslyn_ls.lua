require("lze").load({
	{
		"roslyn.nvim",
		ft = { "cs", "razor" },
		after = function()
			require("roslyn").setup({
				filewatching = "auto",
				broad_search = true,
				lock_target = false,
			})
		end,
	},
})

return {
	cmd = {
		"roslyn-language-server",
		"--stdio",
	},
}
