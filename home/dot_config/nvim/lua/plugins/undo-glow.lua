return {
    'https://github.com/y3owk1n/undo-glow.nvim.git',
    version = '*',
    event = 'VeryLazy',
    keys = {
        { 'u',     function() require('undo-glow').undo() end,        mode = 'n', desc = 'Undo with highlight',        noremap = true },
        { '<C-r>', function() require('undo-glow').redo() end,        mode = 'n', desc = 'Redo with highlight',        noremap = true },
        { 'p',     function() require('undo-glow').paste_below() end, mode = 'n', desc = 'Paste below with highlight', noremap = true },
        { 'P',     function() require('undo-glow').paste_above() end, mode = 'n', desc = 'Paste above with highlight', noremap = true },
        {
            '<Leader>c',
            function()
                local pos = vim.fn.getpos('.')
                vim.schedule(function()
                    vim.fn.setpos('.', pos)
                end)
                return require('undo-glow').comment()
            end,
            mode = { 'n', 'x' },
            desc = 'Toggle comment with highlight',
            expr = true,
            noremap = true,
        },
        { '<Leader>c',  function() require('undo-glow').comment_textobject() end,  mode = 'o', desc = 'Comment textobject with highlight',  noremap = true },
        { '<Leader>cc', function() return require('undo-glow').comment_line() end, mode = 'n', desc = 'Toggle comment line with highlight', expr = true,   noremap = true },
    },
    init = function()
        vim.api.nvim_create_autocmd('TextYankPost', {
            desc = 'Highlight when yanking (copying) text',
            callback = function()
                require('undo-glow').yank()
            end,
        })
    end,
    opts = {
        animation = {
            enabled = true,
            duration = 300,
            animation_type = 'zoom',
        },
        highlights = {
            undo = { hl_color = { bg = '#693232' } },
            redo = { hl_color = { bg = '#2F4640' } },
            yank = { hl_color = { bg = '#7A683A' } },
            paste = { hl_color = { bg = '#325B5B' } },
            search = { hl_color = { bg = '#5C475C' } },
            comment = { hl_color = { bg = '#7A5A3D' } },
            cursor = { hl_color = { bg = '#793D54' } },
        },
        priority = 2048 * 3,
    },
    config = function(_, opts)
        require('undo-glow').setup(opts)

        -- WORKAROUND: undo-glow's dummy (0,0)-(0,1) hook-trigger call also
        -- draws a real highlight, flashing at line 1 col 1. Skip it (see commands.lua).
        local ug_api = require('undo-glow.api')
        local orig_highlight_region_enhanced = ug_api.highlight_region_enhanced
        local dummy_ops = {
            undo = true,
            redo = true,
            paste_below = true,
            paste_above = true,
            yank = true,
        }
        ug_api.highlight_region_enhanced = function(region_opts)
            if
                dummy_ops[region_opts.operation]
                and region_opts.s_row == 0
                and region_opts.s_col == 0
                and region_opts.e_row == 0
                and region_opts.e_col == 1
            then
                ug_api.call_hook('pre_highlight', region_opts)
                ug_api.call_hook('post_highlight', region_opts)
                return
            end
            return orig_highlight_region_enhanced(region_opts)
        end
    end,
}
