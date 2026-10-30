-- Line numbers
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true

-- Tabbing
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.smartindent = true

-- Search settings
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true

-- Undo
vim.opt.swapfile = false
vim.opt.undofile = true

-- Colors
vim.opt.termguicolors = true

-- Hide End-of-Buffer symbols
vim.opt.fillchars:append({ eob = " " })

-- Update time
vim.opt.updatetime = 50

-- See more
vim.opt.scrolloff = 8

-- fix delay in SQL files
vim.g.omni_sql_no_default_maps = 1

-- Don't have `o` add a comment
vim.opt.formatoptions:remove "o"
