local set = vim.opt -- set options
local keymap = vim.keymap

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
keymap.set('n', '<C-b>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- Set color of the terminal
require("nvimcfg.color")
