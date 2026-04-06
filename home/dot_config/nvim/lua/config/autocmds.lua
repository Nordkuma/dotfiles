if not vim.g.vscode then
    vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        command = 'setlocal shiftwidth=2 softtabstop=2 tabstop=2',
    })
end

if vim.fn.executable('ime') == 1 then
    local function ime_off()
        vim.fn.jobstart({ 'ime', 'off' })
    end
    vim.api.nvim_create_autocmd('InsertLeave', { callback = ime_off })
    vim.api.nvim_create_autocmd('CmdlineLeave', { callback = ime_off })
end
