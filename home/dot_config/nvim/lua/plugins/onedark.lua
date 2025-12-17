if (not vim.g.vscode) then
    return {
        {
            'https://github.com/navarasu/onedark.nvim.git',
            priority = 1000,
            config = function()
                require('onedark').setup {
                    code_style = { comments = 'none' },
                }
                require('onedark').load()
            end
        },
    }
else
    return {}
end
