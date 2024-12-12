-- New config. Only Vanilla keymaps here
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

-- Reload config
keymap.set("n", "<leader>ss", ":% source<CR>:Lazy load all<CR>")
keymap.set("n", "<leader>ll", ":Lazy<CR>")
keymap.set("n", "<leader>mm", ":Mason<cr>")

-- Save and quit
keymap.set("n", "<leader>w", vim.cmd.wa)
keymap.set("n", "<leader>q", vim.cmd.q)
------------------
--
-- Launch tmux-sessionizer
vim.keymap.set("n", "<C-e>", "<cmd>silent !tmux neww ~/.scripts/tmux-sessionizer.sh<CR>")

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

-- keymap.set("i", "jj", "<ESC>:w<cr>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

---- Telescope
--vim.keymap.set("n", "<leader>fd", "<cmd>Telescope fd<CR>")
--
---- Editor
--vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
--
---- Copying and pasting
---- Automatically use the plus register so that the system clipboard is accessed
--vim.keymap.set("n", "y", '"+y')
--vim.keymap.set("v", "y", '"+y')
--vim.keymap.set("n", "p", '"+p')
--vim.keymap.set("v", "p", '"+p')
--
---- Moving between panels
--vim.keymap.set("n", "<C-h>", "<C-w>h")
--vim.keymap.set("n", "<C-j>", "<C-w>j")
--vim.keymap.set("n", "<C-k>", "<C-w>k")
--vim.keymap.set("n", "<C-l>", "<C-w>l")
--
---- Splitting
--vim.keymap.set("n", "<leader>;", ":vsplit<CR>")
--vim.keymap.set("n", "<leader>'", ":split<CR>")
--
--vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
--vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
--
--vim.keymap.set("n", "J", "mzJ`z")
--vim.keymap.set("n", "<C-d>", "<C-d>zz")
--vim.keymap.set("n", "<C-u>", "<C-u>zz")
--vim.keymap.set("n", "n", "nzzzv")
--vim.keymap.set("n", "N", "Nzzzv")
--
---- greatest remap ever
--vim.keymap.set("x", "<leader>p", [["_dP]])
--
---- This is going to get me cancelled
---- vim.keymap.set("i", "<C-c>", "<Esc>")
--
--vim.keymap.set("n", "Q", "<nop>")
--
--vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
--
----vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
----vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
--vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
--vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
--
--vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
--vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
--
--vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/jakob/packer.lua<CR>");
--vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
--vim.keymap.set("n", "<leader>gl", "<cmd>CellularAutomaton game_of_life<CR>");
--
--vim.keymap.set("n", "<leader><leader>", function()
--    vim.cmd("so")
--end)
