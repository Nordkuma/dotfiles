return {
    'https://github.com/nvim-mini/mini.surround.git',
    version = '*',
    keys = {
        { '<Leader>sa', mode = { 'n', 'x' } },
        { '<Leader>sd', mode = 'n' },
        { '<Leader>sf', mode = 'n' },
        { '<Leader>sF', mode = 'n' },
        { '<Leader>sh', mode = 'n' },
        { '<Leader>sr', mode = 'n' },
    },
    opts = {
        mappings = {
            add = '<Leader>sa',
            delete = '<Leader>sd',
            find = '<Leader>sf',
            find_left = '<Leader>sF',
            highlight = '<Leader>sh',
            replace = '<Leader>sr',
        },
    },
}
