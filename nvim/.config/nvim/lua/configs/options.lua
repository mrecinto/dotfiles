vim.g.mapleader = " "
vim.o.number = true
vim.o.relativenumber = true
vim.o.wrap = false
vim.o.swapfile = false

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- Command-line completion UI (inline, bottom)
vim.opt.wildmenu = true
vim.opt.wildmode = { "longest:full", "full" }
vim.opt.wildoptions = "pum"
vim.opt.wildignorecase = true
vim.opt.wildcharm = 0


-- "Tell Neovim to accept Meta cleanly"
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 10



