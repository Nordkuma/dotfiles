return {
    'https://github.com/nvim-lualine/lualine.nvim.git',
    dependencies = { 'https://github.com/nvim-tree/nvim-web-devicons.git' },
    opts = {
        options = { theme = 'onedark' },
    },
    enabled = not vim.g.vscode,
}
