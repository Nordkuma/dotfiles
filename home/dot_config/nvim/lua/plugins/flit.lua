return {
    {
        'https://github.com/ggandor/flit.nvim.git',
        dependencies = { 'https://codeberg.org/andyg/leap.nvim.git' },
        enabled = true,
        keys = function()
            ---@type LazyKeysSpec[]
            local ret = {}
            for _, key in ipairs({ 'f', 'F', 't', 'T' }) do
                ret[#ret + 1] = { key, mode = { 'n', 'x', 'o' } }
            end
            return ret
        end,
        opts = {
            labeled_modes = '',
            clever_repeat = true,
            multiline = true,
            opts = { case_sensitive = false },
        },
    },
}
