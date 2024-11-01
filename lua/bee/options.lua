-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Global options and editor settings.
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = 'yes'
vim.opt.showmode = true
vim.opt.undofile = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10

-- Tab width and shift
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Color scheme
vim.cmd.colorscheme "industry"

-- Highlight when we yank
vim.highlight.on_yank()

