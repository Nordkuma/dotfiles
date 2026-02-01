local opt = vim.opt

-- General
opt.autoread = true
if (not vim.g.vscode) then
    opt.backup = false
end
opt.clipboard = { 'unnamed', 'unnamedplus' }
if (not vim.g.vscode) then
    opt.hidden = true
    opt.swapfile = false
    opt.title = true
end
opt.ttimeoutlen = 10

-- Appearance
if (not vim.g.vscode) then
    opt.cursorline = true
    opt.list = true
    opt.listchars = { tab = '>-', trail = '-', extends = '>', precedes = '<', nbsp = '%' }
    opt.showmode = false
    opt.number = true
end
opt.scrolloff = 8
if (not vim.g.vscode) then
    opt.showcmd = true
    opt.showmatch = true
    opt.termguicolors = true
    opt.guicursor = 'n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50'
end

-- Editor
opt.backspace = { 'indent', 'eol', 'start' }
if (not vim.g.vscode) then
    opt.mouse = 'a'
    opt.smartindent = true
end
opt.virtualedit = 'onemore'
opt.whichwrap = 'b,s,h,l,<,>,[,]'
opt.wildmode = { 'list:longest' }

-- Tab / Indent
if (not vim.g.vscode) then
    opt.expandtab = true
    opt.shiftwidth = 4
    opt.smarttab = true
    opt.softtabstop = 4
    opt.tabstop = 4
end

-- Search
opt.hlsearch = true
opt.ignorecase = true
opt.incsearch = true
opt.smartcase = true
opt.wrapscan = true
