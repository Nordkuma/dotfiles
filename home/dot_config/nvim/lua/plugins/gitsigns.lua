return {
    'https://github.com/lewis6991/gitsigns.nvim.git',
    opts = {
        on_attach = function(buffer)
            local gitsigns = package.loaded.gitsigns
            vim.keymap.set('n', '<leader>gd', gitsigns.diffthis, { buffer = buffer })
            vim.keymap.set('n', '<leader>gD', function() gitsigns.diffthis('~') end, { buffer = buffer })
            vim.keymap.set('n', '<leader>gs', gitsigns.toggle_signs, { buffer = buffer })
        end,
    },
    enabled = not vim.g.vscode,
}
