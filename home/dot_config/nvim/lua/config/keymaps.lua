vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

local map = vim.keymap.set

map('', '<Down>', '}')
map('', '<Left>', '^')
map('', '<Right>', '$')
map('', '<Up>', '{')

map({ 'n', 'i', 'v', 'c' }, '<C-Space>', '<Esc>', { silent = true })

map('n', 'c', '"_c')
map('n', 'x', '"_x')
map('n', '*', [[:let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>]], { silent = true })
map('n', '<Leader>l', ':nohlsearch<CR>', { silent = true })
map('n', '<Leader>o', 'o<Esc>', { silent = true })

map('v', '<', '<gv')
map('v', '>', '>gv')
