vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local map = vim.keymap.set

map('', '<Down>', '}')
map('', '<Left>', '^')
map('', '<Right>', '$')
map('', '<Up>', '{')

map({ 'n', 'i', 'v', 'c' }, '<C-Space>', '<Esc>')

map('n', 'c', '"_c')
map('n', 'x', '"_x')
map('n', '*', [[:let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>]], { silent = true })
if vim.fn.has('mac') == 1 and vim.fn.executable('ime') == 1 then
    map('n', '<Esc>', function()
        vim.fn.jobstart({ 'ime', 'off' })
        return '<Esc>'
    end, { expr = true })
elseif vim.fn.has('wsl') == 1 and vim.fn.executable('zenhan') == 1 then
    map('n', '<Esc>', function()
        vim.fn.jobstart({ 'zenhan', '0' })
        return '<Esc>'
    end, { expr = true })
end
map('n', '<Leader>l', ':nohlsearch<CR>', { silent = true })
map('n', '<Leader>o', 'o<Esc>')
map('n', '<Leader>O', 'O<Esc>')
map('n', '<Right>', function() vim.fn.setcharpos('.', { 0, vim.fn.line('.'), vim.fn.charcol('$'), 0, vim.v.maxcol }) end)

map('v', '<', '<gv')
map('v', '>', '>gv')
