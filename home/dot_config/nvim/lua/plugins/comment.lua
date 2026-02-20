return {
    'https://github.com/numToStr/Comment.nvim.git',
    dependencies = {
        'https://github.com/JoosepAlviste/nvim-ts-context-commentstring.git',
        opts = {
            enable_autocmd = false,
        },
    },
    keys = {
        { '<leader>cc', mode = 'n' },
        { '<leader>bc', mode = 'n' },
        { '<leader>c',  mode = { 'n', 'x' } },
        { '<leader>b',  mode = { 'n', 'x' } },
    },
    opts = function()
        return {
            toggler = {
                line = '<leader>cc',
                block = '<leader>bc',
            },
            opleader = {
                line = '<leader>c',
                block = '<leader>b',
            },
            pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        }
    end,
}
