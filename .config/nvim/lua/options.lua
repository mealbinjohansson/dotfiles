local option = vim.o

-- Navigation
option.number = true
option.relativenumber = true
option.wrap = false
option.scrolloff = 10
option.sidescrolloff = 10

-- Indenting
option.tabstop = 2
option.softtabstop = 2
option.smartindent = true

-- Search
option.ignorecase = true
option.smartcase = true
option.hlsearch = true
option.incsearch = true

-- Interface
option.signcolumn = "yes"
option.laststatus = 3

-- File handling
option.undofile = true
option.autoread = true
vim.opt.clipboard = "unnamedplus"
