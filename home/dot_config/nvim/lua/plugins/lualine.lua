if (not vim.g.vscode) then
    return {
        {
            'https://github.com/nvim-lualine/lualine.nvim.git',
            dependencies = { 'https://github.com/nvim-tree/nvim-web-devicons.git' },
            opts = {
                options = { theme = 'onedark' }
            }
        }
    }
else
    return {}
end
