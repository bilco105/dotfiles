vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.completeopt = "menu,menuone,noselect" -- Better completion experience
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Highlight the current line
opt.expandtab = true -- Use spaces instead of tabs
opt.ignorecase = true -- Ignore case
opt.mouse = "a" -- Enable mouse mode
opt.relativenumber = true -- Use relative line numbers for inactive lines
opt.number = true -- Show absolute line number for active line
opt.scrolloff = 4 -- Lines of context
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.showmode = false -- Don't show mode since we have a status line
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn
opt.smartcase = true -- Don't ignore case with capitals
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tab counts for
opt.termguicolors = true -- True colour support
opt.undofile = true -- Enable the undofile
opt.updatetime = 200 -- Speed up key timeouts
opt.wrap = false -- Disable line wrap
