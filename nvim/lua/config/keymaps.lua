-- Ctrl+C in Normal mode: yank current line to system clipboard
vim.keymap.set("n", "<C-c>", '"+yy', {
  desc = "Copy line to system clipboard",
})

-- Ctrl+C in Visual mode: yank selection to system clipboard
vim.keymap.set("v", "<C-c>", '"+y', {
  desc = "Copy selection to system clipboard",
})


-- main options
vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.swapfile = false
vim.o.wrap = true

-- keymaps
vim.keymap.set('n','<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')
