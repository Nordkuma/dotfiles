return {
    'https://github.com/navarasu/onedark.nvim.git',
    priority = 1000,
    opts = {
        code_style = { comments = 'none' },
    },
    config = function(_, opts)
        require('onedark').setup(opts)
        require('onedark').load()
    end,
    enabled = not vim.g.vscode,
}
