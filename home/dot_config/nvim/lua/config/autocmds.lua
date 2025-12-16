if (not vim.g.vscode) then
    vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        command = 'setlocal shiftwidth=2 softtabstop=2 tabstop=2',
    })
end

if vim.fn.has('mac') == 1 and vim.fn.executable('macime') == 1 then
    vim.api.nvim_create_autocmd('InsertLeave', {
        callback = function()
            vim.fn.jobstart({ 'macime', '--save', 'com.apple.keylayout.ABC' })
        end,
    })
    vim.api.nvim_create_autocmd('CmdlineLeave', {
        callback = function()
            vim.fn.jobstart({ 'macime', '--save', 'com.apple.keylayout.ABC' })
        end,
    })
elseif vim.fn.has('wsl') == 1 and vim.fn.executable('zenhan') == 1 then
    vim.api.nvim_create_autocmd('InsertLeave', {
        callback = function()
            vim.fn.jobstart({ 'zenhan', '0' })
        end,
    })
    vim.api.nvim_create_autocmd('CmdlineLeave', {
        callback = function()
            vim.fn.jobstart({ 'zenhan', '0' })
        end,
    })
end
