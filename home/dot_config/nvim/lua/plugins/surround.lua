return {
    'https://github.com/nvim-mini/mini.surround.git',
    version = '*',
    keys = {
        { '<leader>sa', mode = { 'n', 'x' } },
        { '<leader>sd', mode = 'n' },
        { '<leader>sf', mode = 'n' },
        { '<leader>sF', mode = 'n' },
        { '<leader>sh', mode = 'n' },
        { '<leader>sr', mode = 'n' },
    },
    opts = {
        mappings = {
            add = '<leader>sa',
            delete = '<leader>sd',
            find = '<leader>sf',
            find_left = '<leader>sF',
            highlight = '<leader>sh',
            replace = '<leader>sr',
        },
    },
}
