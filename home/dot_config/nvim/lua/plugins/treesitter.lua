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
            { 'af',        mode = { 'x', 'o' } },
            { 'if',        mode = { 'x', 'o' } },
            { 'ac',        mode = { 'x', 'o' } },
            { 'ic',        mode = { 'x', 'o' } },
            { ']f',        mode = { 'n', 'x', 'o' } },
            { ']F',        mode = { 'n', 'x', 'o' } },
            { '[f',        mode = { 'n', 'x', 'o' } },
            { '[F',        mode = { 'n', 'x', 'o' } },
            { ']c',        mode = { 'n', 'x', 'o' } },
            { ']C',        mode = { 'n', 'x', 'o' } },
            { '[c',        mode = { 'n', 'x', 'o' } },
            { '[C',        mode = { 'n', 'x', 'o' } },
            { '<Leader>a', mode = 'n' },
            { '<Leader>A', mode = 'n' },
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
            vim.keymap.set({ 'n', 'x', 'o' }, ']f', function()
                require('nvim-treesitter-textobjects.move').goto_next_start('@function.outer', 'textobjects')
            end)
            vim.keymap.set({ 'n', 'x', 'o' }, ']F', function()
                require('nvim-treesitter-textobjects.move').goto_next_end('@function.outer', 'textobjects')
            end)
            vim.keymap.set({ 'n', 'x', 'o' }, '[f', function()
                require('nvim-treesitter-textobjects.move').goto_previous_start('@function.outer', 'textobjects')
            end)
            vim.keymap.set({ 'n', 'x', 'o' }, '[F', function()
                require('nvim-treesitter-textobjects.move').goto_previous_end('@function.outer', 'textobjects')
            end)
            vim.keymap.set({ 'n', 'x', 'o' }, ']c', function()
                require('nvim-treesitter-textobjects.move').goto_next_start('@class.outer', 'textobjects')
            end)
            vim.keymap.set({ 'n', 'x', 'o' }, ']C', function()
                require('nvim-treesitter-textobjects.move').goto_next_end('@class.outer', 'textobjects')
            end)
            vim.keymap.set({ 'n', 'x', 'o' }, '[c', function()
                require('nvim-treesitter-textobjects.move').goto_previous_start('@class.outer', 'textobjects')
            end)
            vim.keymap.set({ 'n', 'x', 'o' }, '[C', function()
                require('nvim-treesitter-textobjects.move').goto_previous_end('@class.outer', 'textobjects')
            end)
            vim.keymap.set('n', '<Leader>a', function()
                require('nvim-treesitter-textobjects.swap').swap_next '@parameter.inner'
            end)
            vim.keymap.set('n', '<Leader>A', function()
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
