return {
    'https://github.com/nvim-telescope/telescope.nvim.git',
    dependencies = {
        'https://github.com/nvim-lua/plenary.nvim.git',
        { 'https://github.com/nvim-telescope/telescope-fzf-native.nvim.git', build = 'make' },
    },
    keys = {
        { '<Leader>ff', mode = 'n' },
        { '<Leader>fg', mode = 'n' },
        { '<Leader>fw', mode = { 'n', 'x' } },
    },
    opts = {
        defaults = {
            sorting_strategy = 'ascending',
            layout_config = {
                prompt_position = 'top',
            },
        },
    },
    config = function(_, opts)
        require('telescope').setup(opts)
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<Leader>ff', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<Leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<Leader>fw', function()
            builtin.live_grep({ default_text = vim.fn.expand('<cword>') })
        end, { desc = 'Search current word' })
        vim.keymap.set('x', '<Leader>fw', function()
            local saved = { vim.fn.getreg('v'), vim.fn.getregtype('v') }
            vim.cmd('noautocmd normal! "vy')
            local text = vim.fn.getreg('v')
            vim.fn.setreg('v', saved[1], saved[2])
            builtin.live_grep({ default_text = text })
        end, { desc = 'Search current selection' })
        vim.api.nvim_create_autocmd('User', {
            pattern = 'TelescopePreviewerLoaded',
            callback = function()
                vim.wo.number = true
            end,
        })
    end,
    enabled = not vim.g.vscode,
}
