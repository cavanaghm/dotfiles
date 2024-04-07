-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.wo.rnu = true

-- Enable mouse mode
vim.o.mouse = ''

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

vim.opt.wrapscan = false

-- Make file name completion work just like bash
vim.opt.wildmenu = true
vim.opt.wildmode = "longest,list"

vim.opt.scrolloff = 15
vim.opt.sidescrolloff = 25

-- Set colorscheme
vim.o.termguicolors = true
-- vim.cmd [[colorscheme gruvbox]]
-- vim.cmd [[colorscheme slate]]
vim.cmd [[colorscheme tokyonight-night]]

vim.cmd("set noerrorbells")
