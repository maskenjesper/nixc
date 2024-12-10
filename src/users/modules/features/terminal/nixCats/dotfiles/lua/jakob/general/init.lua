require("jakob.general.oil")
require("lze").load({
	{ import = "jakob.general.telescope" },
	{ import = "jakob.general.completion" },
	{ import = "jakob.general.harpoon" },
	{ import = "jakob.general.lualine" },
	{ import = "jakob.general.nvim-tree" },
	{ import = "jakob.general.autoclose" },
	{ import = "jakob.general.which-key" },
	{ import = "jakob.general.treesitter" },
	{ import = "jakob.general.snacks" },
	----------------------------------------------------------------------------------------------------
	{
		"dressing.nvim",
	},
	----------------------------------------------------------------------------------------------------
	{
		"neoscroll.nvim",
		config = true,
	},

	{
		-- Only binding this plugin provides that I need to know is `gc` when in visual mode which comments out the selected text.
		"Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = true, -- runs require('Comment').setup()
	},
	{
		"vim-tmux-navigator",
	},
})
