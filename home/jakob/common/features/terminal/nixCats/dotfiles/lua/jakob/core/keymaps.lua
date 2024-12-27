-- New config. Only Vanilla keymaps here
vim.g.mapleader = " "

-- Reload config
vim.keymap.set("n", "<leader>ss", ":% source<CR>")

-- Save and quit
vim.keymap.set("n", "<leader>w", vim.cmd.wa)
vim.keymap.set("n", "<leader>q", vim.cmd.q)
------------------
--
-- Launch tmux-sessionizer
vim.keymap.set("n", "<C-e>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Copy pasting --
-- Use the plus register so that the system clipboard is accessed
vim.keymap.set("n", "y", "y")
vim.keymap.set("v", "y", "y")
vim.keymap.set("n", "p", "p")
vim.keymap.set("v", "p", "p")
-- Copy/Paste normally
vim.keymap.set("n", "<C-y>", '"+y')
vim.keymap.set("v", "<C-y>", '"+y')
vim.keymap.set("n", "<C-p>", '"+p')
vim.keymap.set("v", "<C-p>", '"+p')

-- buffers
vim.keymap.set("n", "<leader>b", ":bprev<CR>", { desc = "Goto prev buffer" })
vim.keymap.set("n", "<leader>p", ":bnext<CR>", { desc = "Goto next buffer" })

-- keymap.set("i", "jj", "<ESC>:w<cr>", { desc = "Exit insert mode with jk" })

vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
