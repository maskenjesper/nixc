require("mini.surround").setup()

local MiniCompletion = require("mini.completion")
MiniCompletion.setup({
	lsp_completion = {
		auto_setup = true,
		process_items = function(items, base)
			return MiniCompletion.default_process_items(items, base, {
				filtersort = "fuzzy",
			})
		end,
	},
})
