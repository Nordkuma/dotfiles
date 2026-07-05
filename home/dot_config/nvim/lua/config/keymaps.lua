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
map('n', '*', function()
    vim.fn.setreg('/', [[\<]] .. vim.fn.expand('<cword>') .. [[\>]])
    vim.opt.hlsearch = true
end)
if vim.fn.executable('ime') == 1 then
    map('n', '<Esc>', function()
        vim.fn.jobstart({ 'ime', 'off' })
        return '<Esc>'
    end, { expr = true })
end
map('n', '<Leader>l', '<cmd>nohlsearch<CR>', { silent = true })
map('n', '<Leader>o', 'o<Esc>')
map('n', '<Leader>O', 'O<Esc>')
map('n', '<Leader>q', '<cmd>Q<CR>')
map('n', '<Leader>Q', '<cmd>Q!<CR>')
map('n', '<Leader>w', '<cmd>w<CR>')
map('n', '<Leader>x', '<cmd>X<CR>')
map('n', '<Leader>z', '<cmd>qa<CR>')
map('n', '<Leader>Z', '<cmd>qa!<CR>')
map('n', '<Right>', function() vim.fn.setcharpos('.', { 0, vim.fn.line('.'), vim.fn.charcol('$'), 0, vim.v.maxcol }) end)

map('v', '<', '<gv')
map('v', '>', '>gv')

map('c', '<Down>', function() return vim.fn.wildmenumode() == 1 and '<C-n>' or '<Down>' end, { expr = true })
map('c', '<Left>', '<Space><BS><Left>')
map('c', '<Right>', '<Space><BS><Right>')
map('c', '<Up>', function() return vim.fn.wildmenumode() == 1 and '<C-p>' or '<Up>' end, { expr = true })
