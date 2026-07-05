return {
    'https://github.com/akinsho/bufferline.nvim.git',
    version = '*',
    dependencies = {
        { 'https://github.com/nvim-mini/mini.bufremove.git', version = '*' },
        'https://github.com/nvim-tree/nvim-web-devicons.git',
    },
    event = 'VeryLazy',
    keys = {
        { '<Leader>[', function() require('bufferline').cycle(-1) end, desc = 'Previous buffer' },
        { '<Leader>]', function() require('bufferline').cycle(1) end,  desc = 'Next buffer' },
    },
    opts = function()
        local opened_dir = vim.fn.argc() > 0 and vim.fn.isdirectory(vim.fn.argv(0)) == 1
        return {
            options = {
                always_show_bufferline = opened_dir,
                color_icons = true,
                style_preset = require('bufferline').style_preset.no_italic,
                close_command = function(bufnr) require('mini.bufremove').delete(bufnr, false) end,
                right_mouse_command = function(bufnr) require('mini.bufremove').delete(bufnr, false) end,
                offsets = {
                    {
                        filetype = 'neo-tree',
                        text = 'File Explorer',
                        text_align = 'left',
                        separator = false,
                    },
                },
            },
        }
    end,
    enabled = not vim.g.vscode,
}
