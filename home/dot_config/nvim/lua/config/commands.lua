local function is_no_name_buffer()
    return vim.api.nvim_buf_get_name(0) == '' and vim.bo.buftype == ''
end

local function opened_dir()
    return vim.fn.argc() > 0 and vim.fn.isdirectory(vim.fn.argv(0)) == 1
end

local function should_replace_with_scratch()
    if #vim.fn.getbufinfo({ buflisted = 1 }) > 1 then
        return true
    end
    if is_no_name_buffer() then
        return false
    end
    return opened_dir()
end

local function close_buffer(force)
    if vim.g.vscode then
        require('vscode').action(force and 'workbench.action.revertAndCloseActiveEditor' or
            'workbench.action.closeActiveEditor')
    elseif not should_replace_with_scratch() then
        vim.cmd(force and 'q!' or 'q')
    else
        require('mini.bufremove').delete(0, force)
    end
end

local function close_all(force)
    if vim.g.vscode then
        require('vscode').action(force and 'workbench.action.closeAllEditors' or
            'workbench.action.closeUnmodifiedEditors')
    else
        vim.cmd(force and 'qa!' or 'qa')
    end
end

local function save_and_close_buffer()
    if vim.g.vscode then
        require('vscode').call('workbench.action.files.save')
        require('vscode').action('workbench.action.closeActiveEditor')
        return
    end
    if vim.bo.modified then
        vim.cmd('write')
    end
    if not should_replace_with_scratch() then
        vim.cmd('x')
    else
        require('mini.bufremove').delete(0, false)
    end
end

vim.api.nvim_create_user_command('Q', function(opts) close_buffer(opts.bang) end, { bang = true })
vim.api.nvim_create_user_command('Qa', function(opts) close_all(opts.bang) end, { bang = true })
vim.api.nvim_create_user_command('X', save_and_close_buffer, {})

vim.cmd([[cnoreabbrev <expr> q  (getcmdtype() ==# ':' && getcmdline() ==# 'q')  ? 'Q' : 'q']])
vim.cmd([[cnoreabbrev <expr> q! (getcmdtype() ==# ':' && getcmdline() ==# 'q!') ? 'Q!' : 'q!']])
vim.cmd([[cnoreabbrev <expr> x  (getcmdtype() ==# ':' && getcmdline() ==# 'x')  ? 'X' : 'x']])
