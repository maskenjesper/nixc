return {
	"lualine.nvim",
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	after = function()
		local lualine = require("lualine")

		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = "auto",
			},
			sections = {
				lualine_x = {
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
				lualine_c = {
					{ "filename", path = 1 },
				},
			},
		})
	end,
}
