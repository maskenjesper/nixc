-- Client configs for the language servers I use.
local servers = {
	lua_ls = {
		Lua = {
			formatters = {
				ignoreComments = true,
			},
			signatureHelp = { enabled = true },
			diagnostics = {
				globals = { "vim" },
				disable = { "missing-fields" },
			},
		},
		telemetry = { enabled = false },
		filetypes = { "lua" },
	},
	nixd = {
		nixd = {
			nixpkgs = {},
			formatting = {
				command = { "alejandra" },
			},
			diagnostic = {
				suppress = {
					"sema-escaping-with",
				},
			},
		},
	},
	clangd = {},
	cmake = {},
}

-- Set the default root marker for all LSP clients.
vim.lsp.config("*", {
	root_markers = { ".git" },
})

-- Use the 'servers' table to set the configuration for all LSP clients.
for server_name, cfg in pairs(servers) do
	vim.lsp.config(server_name, {

		-- capabilities = require("jakob.lsp.caps-on_attach").get_capabilities(server_name),
		-- this line is interchangeable with the above LspAttach autocommand
		-- on_attach = require("jakob.lsp.caps-on_attach").on_attach,
		settings = cfg,
		filetypes = (cfg or {}).filetypes,
		cmd = (cfg or {}).cmd,
		root_pattern = (cfg or {}).root_pattern,
	})
	vim.lsp.enable(server_name)
end
