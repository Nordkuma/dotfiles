local map = vim.keymap.set

map('', '<Left>', '0')
map('', '<Right>', '$')

map('n', 's', '"_s')
map('n', 'x', '"_x')
map('n', '*', [[:let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>]], { silent = true })
map('n', '<C-Space>', ':nohlsearch<CR>', { silent = true })

map('i', '<C-Space>', '<Esc>', { silent = true })

map('v', '<C-Space>', '<Esc>', { silent = true })

map('c', '<C-Space>', '<Esc>', { silent = true })
