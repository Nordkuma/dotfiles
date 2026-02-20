return {
    {
        'https://github.com/nvim-treesitter/nvim-treesitter.git',
        branch = 'main',
        build = ':TSUpdate',
        event = 'FileType',
        config = function()
            vim.api.nvim_create_autocmd('FileType', {
                group = vim.api.nvim_create_augroup('vim-treesitter-start', {}),
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })
        end,
    },
    {
        'https://github.com/nvim-treesitter/nvim-treesitter-textobjects.git',
        branch = 'main',
        keys = {
            { '<leader>af', mode = { 'x', 'o' } },
            { '<leader>if', mode = { 'x', 'o' } },
            { '<leader>ac', mode = { 'x', 'o' } },
            { '<leader>ic', mode = { 'x', 'o' } },
            { '<leader>a',  mode = 'n' },
            { '<leader>A',  mode = 'n' },
        },
        init = function()
            vim.g.no_plugin_maps = true
        end,
        config = function()
            vim.keymap.set({ 'x', 'o' }, 'af', function()
                require 'nvim-treesitter-textobjects.select'.select_textobject('@function.outer', 'textobjects')
            end)
            vim.keymap.set({ 'x', 'o' }, 'if', function()
                require 'nvim-treesitter-textobjects.select'.select_textobject('@function.inner', 'textobjects')
            end)
            vim.keymap.set({ 'x', 'o' }, 'ac', function()
                require 'nvim-treesitter-textobjects.select'.select_textobject('@class.outer', 'textobjects')
            end)
            vim.keymap.set({ 'x', 'o' }, 'ic', function()
                require 'nvim-treesitter-textobjects.select'.select_textobject('@class.inner', 'textobjects')
            end)
            vim.keymap.set('n', '<leader>a', function()
                require('nvim-treesitter-textobjects.swap').swap_next '@parameter.inner'
            end)
            vim.keymap.set('n', '<leader>A', function()
                require('nvim-treesitter-textobjects.swap').swap_previous '@parameter.inner'
            end)
        end,
    },
    {
        'https://github.com/nvim-treesitter/nvim-treesitter-context.git',
        event = 'FileType',
        opts = {
            enable = true,
            mode = 'topline',
        },
        enabled = not vim.g.vscode,
    },
}
