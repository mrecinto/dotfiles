-- Ctrl+C in Normal mode: yank current line to system clipboard
vim.keymap.set("n", "<C-c>", '"+yy', {
  desc = "Copy line to system clipboard",
})

-- Ctrl+C in Visual mode: yank selection to system clipboard
vim.keymap.set("v", "<C-c>", '"+y', {
  desc = "Copy selection to system clipboard",
})


-- Ctrl+A: select entire buffer
vim.keymap.set('n', '<C-a>', 'ggVG', {
  desc = 'Select all',
})


-- Ctrl+X in Visual mode: cut selection to system clipboard
vim.keymap.set('v', '<C-x>', '"+d', {
  desc = 'Cut selection to system clipboard',
})

-- Ctrl+X in Normal mode: cut line to system clipboard
vim.keymap.set('n', '<C-x>', '"+dd', {
  desc = 'Cut line to system clipboard',
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

-- Alt (Windows / proper Meta terminals)
vim.keymap.set('n', '<C-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { silent = true })

-- ESC-prefixed Alt (Linux / kitty)
vim.keymap.set('n', '<A-h>', '<C-w>h', { silent = true })
vim.keymap.set('n', '<A-j>', '<C-w>j', { silent = true })
vim.keymap.set('n', '<A-k>', '<C-w>k', { silent = true })
vim.keymap.set('n', '<A-l>', '<C-w>l', { silent = true })
-- Optional: quick split creation
vim.keymap.set('n', '<A-v>', '<C-w>v', { silent = true })
vim.keymap.set('n', '<A-s>', '<C-w>s', { silent = true })
vim.keymap.set('n', '<A-q>', '<C-w>q', { silent = true })

vim.keymap.set('n', '<Esc>v', '<C-w>v', { silent = true })
vim.keymap.set('n', '<Esc>s', '<C-w>s', { silent = true })
vim.keymap.set('n', '<Esc>q', '<C-w>q', { silent = true })


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

-- Toggle Typst preview dark/light
vim.keymap.set('n', '<leader>tt', function()
  require('typst-preview').toggle_theme()
end, {
  desc = 'Toggle Typst preview theme',
})

-- Ctrl+/ toggle comment
vim.keymap.set('n', '<C-_>', function()
  require('Comment.api').toggle.linewise.current()
end, { desc = 'Toggle comment' })

vim.keymap.set('v', '<C-_>', function()
  local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
  vim.api.nvim_feedkeys(esc, 'nx', false)
  require('Comment.api').toggle.linewise(vim.fn.visualmode())
end, { desc = 'Toggle comment (visual)' })

-- typst preview
vim.keymap.set("n", "<leader>tp", "<cmd>TypstPreviewToggle<CR>", {
  desc = "Typst: toggle preview",
})






