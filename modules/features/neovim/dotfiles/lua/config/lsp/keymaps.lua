local M = {}

function M.on_attach(_, bufnr)
	local opts = { buffer = bufnr, silent = true }

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, vim.tbl_extend("force", opts, { desc = "Go to definition" }))

	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))

	vim.keymap.set("n", "gr", vim.lsp.buf.references, vim.tbl_extend("force", opts, { desc = "Find references" }))

	vim.keymap.set(
		"n",
		"gi",
		vim.lsp.buf.implementation,
		vim.tbl_extend("force", opts, { desc = "Go to implementation" })
	)

	vim.keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover documentation" }))

	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))

	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))

	vim.keymap.set("n", "<leader>f", function()
		vim.lsp.buf.format({ bufnr = bufnr })
	end, vim.tbl_extend("force", opts, { desc = "Format buffer" }))
end

return M
