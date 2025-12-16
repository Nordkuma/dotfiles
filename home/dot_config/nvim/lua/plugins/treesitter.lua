if (not vim.g.vscode) then
    return {
        {
            'https://github.com/nvim-treesitter/nvim-treesitter.git',
            branch = 'main',
            build = ':TSUpdate',
            event = 'FileType',
            config = function()
                vim.api.nvim_create_autocmd('FileType', {
                    group = vim.api.nvim_create_augroup('vim-treesitter-start', {}),
                    callback = function()
                        pcall(vim.treesitter.start)
                    end,
                })
            end
        },
        {
            'https://github.com/nvim-treesitter/nvim-treesitter-context.git',
            event = 'FileType',
            opts = {
                enable = true,
                mode = 'topline'
            }
        }
    }
else
    return {}
end
