return {
    'https://github.com/nvim-neo-tree/neo-tree.nvim.git',
    branch = 'v3.x',
    dependencies = {
        'https://github.com/nvim-lua/plenary.nvim.git',
        'https://github.com/MunifTanjim/nui.nvim.git',
        'https://github.com/nvim-tree/nvim-web-devicons.git',
    },
    opts = {
        window = {
            width = 36,
        },
    },
    config = function(_, opts)
        require('neo-tree').setup(opts)
        local function strip_italic()
            for _, name in ipairs({ 'NeoTreeGitConflict', 'NeoTreeGitUntracked', 'NeoTreeMessage', 'NeoTreeRootName' }) do
                local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
                if hl.italic then
                    hl.italic = false
                    vim.api.nvim_set_hl(0, name, hl)
                end
            end
        end
        strip_italic()
        vim.api.nvim_create_autocmd('ColorScheme', { callback = strip_italic })
        vim.api.nvim_create_autocmd('QuitPre', {
            callback = function()
                local tree_wins = {}
                local floating_wins = {}
                local wins = vim.api.nvim_list_wins()
                for _, w in ipairs(wins) do
                    if vim.api.nvim_win_get_config(w).relative ~= '' then
                        table.insert(floating_wins, w)
                    end
                    if vim.bo[vim.api.nvim_win_get_buf(w)].filetype == 'neo-tree' then
                        table.insert(tree_wins, w)
                    end
                end
                if #tree_wins > 0 and #wins - #floating_wins - #tree_wins == 1 then
                    for _, w in ipairs(tree_wins) do
                        vim.api.nvim_win_close(w, true)
                    end
                end
            end,
        })
    end,
    enabled = not vim.g.vscode,
}
