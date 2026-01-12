vim.keymap.set("n", "<leader>mv", function()
  local buf = vim.api.nvim_get_current_buf()
  local enabled = vim.b[buf].markview_enabled
  if enabled == nil then enabled = true end

  if enabled then
    vim.cmd("Markview disable")
  else
    vim.cmd("Markview enable")
  end

  vim.b[buf].markview_enabled = not enabled
end, {
  desc = "Toggle Markview rendering (buffer-local)",
})


vim.keymap.set("n", "<leader>oo", function()
  local vault = "personal"
  local vault_root = vim.fn.expand("~/Documents/personal/")
  local full = vim.fn.expand("%:p")

  if not vim.startswith(full, vault_root) then
    vim.notify("File is not inside the 'personal' Obsidian vault", vim.log.levels.ERROR)
    return
  end

  local rel = full:sub(#vault_root + 1)

  local encoded = rel
    :gsub("\n", "\r\n")
    :gsub("([^%w%-_%.~])", function(c)
      return string.format("%%%02X", string.byte(c))
    end)

  local uri = string.format(
    "obsidian://open?vault=%s&file=%s&new=true",
    vault,
    encoded
  )

  vim.fn.jobstart({ "xdg-open", uri }, { detach = true })
end, { desc = "Open current file in Obsidian (new window)" })








vim.keymap.set("i", "<M-w>", "<C-w>", { noremap = true })



vim.keymap.set("n", "gf", function()
  return require("obsidian").util.gf_passthrough()
end, {
  noremap = false,
  expr = true,
  desc = "Obsidian: follow link or create note",
})
vim.keymap.set("n", "<leader>ni", function()
  vim.ui.input({ prompt = "Inbox note name: " }, function(name)
    if not name or name == "" then return end

    -- sanitize to a simple filename
    local filename = name:gsub("[/\\]", "-") .. ".md"
    local path = vim.fn.expand("~/Documents/personal/01 - inbox/" .. filename)

    vim.cmd("edit " .. vim.fn.fnameescape(path))
  end)
end, { desc = "Inbox capture" })


vim.keymap.set("n", "<leader>on", function()
  require("obsidian").move_note({
    dir = "02 - zettles/00 - staging",
  })
end, { desc = "Promote to Zettel (staging)" })

vim.keymap.set("n", "<leader>ot", "<cmd>Obsidian new_from_template<cr>", {
  desc = "New Zettel (template)",
})
vim.keymap.set("n", "<leader>of", "<cmd>Obsidian quick_switch<cr>", {
  desc = "Find Obsidian note",
})

-- vim.keymap.set("n", "<leader>oo", "<cmd>Obsidian follow_link<cr>", {
--   desc = "Obsidian: follow link",
--   silent = true,
-- })
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianQuickSwitch<cr>", {
  desc = "Obsidian: quick switch",
})
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", {
  desc = "Obsidian: backlinks",
})

-- Alt navigation in command-line mode (completion-aware)
vim.keymap.set("c", "<M-j>", function()
  return vim.fn.pumvisible() == 1 and "<C-n>" or "<Down>"
end, { expr = true, noremap = true })

vim.keymap.set("c", "<M-k>", function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<Up>"
end, { expr = true, noremap = true })



vim.keymap.set("n", "gx", function()
  vim.fn.jobstart({
    "firefox",
    "--new-window",
    vim.fn.expand("<cfile>")
  }, { detach = true })
end, { silent = true })

vim.keymap.set(
  "n",
  "<leader>v",
  function()
    vim.cmd("edit " .. vim.fn.stdpath("config") .. "/lua/configs/keymaps.lua")
  end,
  { desc = "Open keymaps config" }
)


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
-- vim.keymap.set('n','<leader>o', ':update<CR> :source<CR>')
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
vim.keymap.set(
  "n",
  "<M-;>",
  "<Cmd>Neotree toggle<CR>",
  { silent = true }
)

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


-- barbar
-- Alt + number → go to buffer
for i = 1, 9 do
  -- Normal mode (you already have this)
  vim.keymap.set(
    "n",
    "<M-" .. i .. ">",
    "<Cmd>BufferGoto " .. i .. "<CR>",
    { silent = true, desc = "Go to buffer " .. i }
  )

  -- Insert mode (new)
  vim.keymap.set(
    "i",
    "<M-" .. i .. ">",
    function()
      vim.cmd("stopinsert")
      vim.cmd("BufferGoto " .. i)
      vim.cmd("startinsert")
    end,
    { silent = true, desc = "Go to buffer " .. i .. " (insert)" }
  )
end

-- Alt + 0 → last buffer
vim.keymap.set(
  "n",
  "<M-0>",
  "<Cmd>BufferLast<CR>",
  { silent = true, desc = "Go to last buffer" }
)

vim.keymap.set(
  "n",
  "<M-w>",
  "<Cmd>BufferClose<CR>",
  { silent = true, desc = "Close buffer" }
)

-- Barbar tab navigation
vim.keymap.set('n', '<M-[>', '<Cmd>BufferPrevious<CR>', { desc = 'Previous buffer (tab)' })
vim.keymap.set('n', '<M-]>', '<Cmd>BufferNext<CR>',     { desc = 'Next buffer (tab)' })

