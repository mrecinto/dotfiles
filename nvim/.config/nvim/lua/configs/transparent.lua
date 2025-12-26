local state_file = vim.fn.stdpath("state") .. "/nvim_transparency"

-- groups we control
local groups = {
  "Normal",
  "NormalNC",
  "SignColumn",
  "EndOfBuffer",
  "LineNr",
  "CursorLineNr",
  "NormalFloat",
  "FloatBorder",
  "NeoTreeNormal",
  "NeoTreeNormalNC",
  "NeoTreeEndOfBuffer",
  "WinSeparator",
}

-- store original backgrounds per highlight group
local saved_bg = {}

local function capture_backgrounds()
  saved_bg = {}
  for _, g in ipairs(groups) do
    local hl = vim.api.nvim_get_hl(0, { name = g, link = false })
    if hl.bg then
      saved_bg[g] = hl.bg
    end
  end
end

local function set_transparent()
  for _, g in ipairs(groups) do
    vim.api.nvim_set_hl(0, g, { bg = "none" })
  end
end

local function restore_backgrounds()
  for g, bg in pairs(saved_bg) do
    vim.api.nvim_set_hl(0, g, { bg = bg })
  end
end

local function is_transparent()
  local hl = vim.api.nvim_get_hl(0, { name = "Normal", link = false })
  return hl.bg == nil
end

-- load saved state
local transparent = true
do
  local f = io.open(state_file, "r")
  if f then
    transparent = (f:read("*l") == "1")
    f:close()
  end
end

local function save_state()
  local f = io.open(state_file, "w")
  if f then
    f:write(transparent and "1" or "0")
    f:close()
  end
end

-- apply after all plugins & colorscheme
vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    capture_backgrounds()
    transparent = is_transparent()

    if transparent then
      set_transparent()
    else
      restore_backgrounds()
    end
  end,
})

-- toggle keymap
vim.keymap.set("n", "<leader>tb", function()
  transparent = not transparent

  if transparent then
    capture_backgrounds()
    set_transparent()
  else
    restore_backgrounds()
  end

  save_state()
end, { desc = "Toggle background transparency (theme-agnostic)" })


local M = {}

vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    if package.loaded["configs.transparent"] then
      require("configs.transparent")._reapply()
    end
  end,
})


function M._reapply()
  if transparent then
    set_transparent()
  else
    restore_backgrounds()
  end
end

return M


