-- Ctrl+C in Normal mode: yank current line to system clipboard
vim.keymap.set("n", "<C-c>", '"+yy', {
  desc = "Copy line to system clipboard",
})

-- Ctrl+C in Visual mode: yank selection to system clipboard
vim.keymap.set("v", "<C-c>", '"+y', {
  desc = "Copy selection to system clipboard",
})

-- keymaps
vim.keymap.set('n','<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

-- change themes using themery
vim.keymap.set("n", "<leader>ut", "<cmd>Themery<CR>", {
  desc = "Theme picker",
})

-- force quit
vim.keymap.set("n", "<leader>Q", ":q!<CR>", { silent = true })

-- Neo-tree
vim.keymap.set('n', '\\', '<cmd>Neotree toggle<CR>', { silent = true })
--vim.keymap.set('n', '<leader>o', '<cmd>Neotree focus<CR>',  { silent = true })

-- Window navigation (simple + universal)
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true })

-- Optional: quick split creation
vim.keymap.set('n', '<leader>sv', '<C-w>v', { silent = true }) -- vertical split
vim.keymap.set('n', '<leader>sh', '<C-w>s', { silent = true }) -- horizontal split
vim.keymap.set('n', '<leader>sq', '<C-w>q', { silent = true }) -- close window


-- Indent while staying in visual mode
vim.keymap.set("v", "<Tab>", ">gv", { silent = true })
vim.keymap.set("v", "<S-Tab>", "<gv", { silent = true })


-- Diagnostics (non-conflicting)
vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float, {
  desc = 'Diagnostic under cursor',
})

vim.keymap.set('n', '<leader>dl', vim.diagnostic.setloclist, {
  desc = 'Diagnostics list (current file)',
})

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {
  desc = 'Previous diagnostic',
})

vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {
  desc = 'Next diagnostic',
})

