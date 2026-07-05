return {
    'https://github.com/folke/noice.nvim.git',
    event = 'VeryLazy',
    dependencies = {
        'https://github.com/MunifTanjim/nui.nvim.git',
        'https://github.com/rcarriga/nvim-notify.git',
    },
    opts = function()
        local input_height = 3
        local row_ratio = 0.4
        local popup_row = math.ceil((vim.o.lines - input_height) * row_ratio)
        return {
            lsp = {
                override = {
                    ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                    ['vim.lsp.util.stylize_markdown'] = true,
                },
            },
            presets = {
                command_palette = true,
                long_message_to_split = true,
            },
            routes = {
                {
                    filter = {
                        event = 'msg_show',
                        kind = { 'shell_cmd', 'shell_out', 'shell_err', 'shell_ret' },
                    },
                    view = 'split',
                    opts = {
                        enter = true,
                    }
                },
            },
            views = {
                cmdline_popup = {
                    position = { row = (row_ratio * 100) .. '%' },
                },
                cmdline_popupmenu = {
                    position = { row = popup_row + input_height },
                },
            },
        }
    end,
    enabled = not vim.g.vscode,
}
