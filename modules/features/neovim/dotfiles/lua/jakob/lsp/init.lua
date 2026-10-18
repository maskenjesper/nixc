local servers = {
	lua_ls = require("jakob.lsp.lua_ls"),
	nixd = require("jakob.lsp.nixd"),
	roslyn_ls = require("jakob.lsp.roslyn_ls"),
	clangd = {},
	cmake = {},
}

local keymaps = require("jakob.lsp.keymaps")

for server_name, cfg in pairs(servers) do
	local server_on_attach = cfg.on_attach

	cfg.on_attach = function(client, bufnr)
		keymaps.on_attach(client, bufnr)

		if server_on_attach then
			server_on_attach(client, bufnr)
		end
	end
	vim.lsp.config(server_name, cfg)
	vim.lsp.enable(server_name)
end
