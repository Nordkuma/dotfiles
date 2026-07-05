return {
    'https://github.com/HiPhish/rainbow-delimiters.nvim.git',
    event = 'FileType',
    config = function()
        local ok, colors = pcall(require, 'onedark.colors')
        if ok then
            vim.api.nvim_set_hl(0, 'RainbowDelimiterRed', { fg = colors.red })
            vim.api.nvim_set_hl(0, 'RainbowDelimiterYellow', { fg = colors.yellow })
            vim.api.nvim_set_hl(0, 'RainbowDelimiterBlue', { fg = colors.blue })
            vim.api.nvim_set_hl(0, 'RainbowDelimiterOrange', { fg = colors.orange })
            vim.api.nvim_set_hl(0, 'RainbowDelimiterGreen', { fg = colors.green })
            vim.api.nvim_set_hl(0, 'RainbowDelimiterViolet', { fg = colors.purple })
            vim.api.nvim_set_hl(0, 'RainbowDelimiterCyan', { fg = colors.cyan })
        end
    end,
    enabled = not vim.g.vscode,
}
