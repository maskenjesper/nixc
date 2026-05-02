vim.cmd.colorscheme("kanagawa-dragon")

if not vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  -- make background transparent
  vim.cmd [[
    highlight Normal guibg=none
    highlight NonText guibg=none
    highlight Normal ctermbg=none
    highlight NonText ctermbg=none
    highlight SignColumn guibg=none
    highlight SignColumn ctermbg=none
  ]]
end
