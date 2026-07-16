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
    init = function()
        vim.api.nvim_create_autocmd('FileType', {
            pattern = 'neo-tree',
            desc = 'Bold text for bufferline explorer offset',
            callback = function()
                local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = 'NeoTreeNormal', link = false })
                vim.api.nvim_set_hl(
                    0,
                    'BufferlineOffsetNeoTree',
                    vim.tbl_extend('force', ok and hl or {}, { bold = true })
                )
            end,
        })
    end,
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
                        text = '󰥨 EXPLORER',
                        text_align = 'left',
                        separator = false,
                        highlight = 'BufferlineOffsetNeoTree',
                    },
                },
            },
        }
    end,
    enabled = not vim.g.vscode,
}
