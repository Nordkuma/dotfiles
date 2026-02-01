return {
    'https://github.com/windwp/nvim-autopairs.git',
    event = 'InsertEnter',
    config = true,
    enabled = not vim.g.vscode,
}
