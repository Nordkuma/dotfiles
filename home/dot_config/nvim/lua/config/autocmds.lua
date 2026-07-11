if not vim.g.vscode then
    local is_noice_ready = nil

    local function notify_via_noice(msg, level, tries)
        if is_noice_ready ~= nil then
            vim.notify(msg, level)
            return
        end

        tries = (tries or 0) + 1
        if debug.getinfo(vim.notify).short_src:find('noice', 1, true) then
            is_noice_ready = true
            vim.notify(msg, level)
        elseif tries > 20 then
            is_noice_ready = false
            vim.notify(msg, level)
        else
            vim.defer_fn(function()
                notify_via_noice(msg, level, tries)
            end, 100)
        end
    end

    vim.api.nvim_create_autocmd('BufWinEnter', {
        callback = function(args)
            if vim.bo[args.buf].readonly then
                local msg = ('Read-only file: %s'):format(vim.api.nvim_buf_get_name(args.buf))
                notify_via_noice(msg, vim.log.levels.WARN)
            end
        end,
    })

    vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        command = 'setlocal shiftwidth=2 softtabstop=2 tabstop=2',
    })
end

if vim.fn.executable('ime') == 1 then
    local function ime_off()
        vim.fn.jobstart({ 'ime', 'off' })
    end
    vim.api.nvim_create_autocmd('InsertLeave', { callback = ime_off })
    vim.api.nvim_create_autocmd('CmdlineLeave', { callback = ime_off })
end
