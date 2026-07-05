return {
    'https://github.com/numToStr/Comment.nvim.git',
    dependencies = {
        'https://github.com/JoosepAlviste/nvim-ts-context-commentstring.git',
        opts = {
            enable_autocmd = false,
        },
    },
    keys = {
        { '<Leader>cc', mode = 'n' },
        { '<Leader>bc', mode = 'n' },
        { '<Leader>c',  mode = { 'n', 'x' } },
        { '<Leader>b',  mode = { 'n', 'x' } },
    },
    opts = function()
        return {
            toggler = {
                line = '<Leader>cc',
                block = '<Leader>bc',
            },
            opleader = {
                line = '<Leader>c',
                block = '<Leader>b',
            },
            pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        }
    end,
}
