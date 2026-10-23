local save_session = function ()
    local ok, err = pcall(vim.cmd, 'mksession! .session.vim')
    if ok then
        print('session saved')
    else
        print("couldn't save session: " .. err)
    end
end
local delete_session = function ()
    local res = vim.fn.delete('.session.vim')
    if res == 0 then
        print('deleted session file')
    else
        print('no session file exists')
    end
end
local restore_session = function ()
    local ok, err = pcall(vim.cmd, 'source .session.vim')
    if ok then
        print('restored session')
    else
        print("couldn't source session: " .. err)
    end
end
vim.keymap.set('n', '<leader>ss', save_session)
vim.keymap.set('n', '<leader>sd', delete_session)
vim.keymap.set('n', '<leader>so', restore_session)

-- auto save on exit if a session file already exists
vim.api.nvim_create_autocmd('VimLeavePre', {
    pattern = '*',
    callback = function()
        if vim.uv.fs_stat('.session.vim') ~= nil then
            vim.cmd('mksession! .session.vim')
        end
    end,
})
