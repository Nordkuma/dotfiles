return {
    'https://github.com/lukas-reineke/indent-blankline.nvim.git',
    main = 'ibl',
    event = 'VeryLazy',
    opts = {
        indent = {
            char = '▏',
        },
        scope = {
            show_start = false,
            show_end = false,
        },
    },
    config = function(_, opts)
        local ok, colors = pcall(require, 'onedark.colors')
        if ok then
            vim.api.nvim_set_hl(0, 'IblScope', { fg = colors.grey })
        end
        require('ibl').setup(opts)
    end,
    enabled = not vim.g.vscode,
}
