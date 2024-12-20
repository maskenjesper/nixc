return {
	"obsidian.nvim",
	after = function()
		require("obsidian").setup({
			workspaces = {
				{
					name = "personal",
					path = "~/secondbrain",
				},
			},

			-- see below for full list of options 👇
		})
	end,
}
