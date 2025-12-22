local map = vim.keymap.set

map('', '<Left>', '0')
map('', '<Right>', '$')

map({ 'n', 'i', 'v', 'c' }, '<C-Space>', '<Esc>', { silent = true })

map('n', 's', '"_s')
map('n', 'x', '"_x')
map('n', '*', [[:let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>]], { silent = true })
map('n', '<Esc><Esc>', ':nohlsearch<CR>', { silent = true })
