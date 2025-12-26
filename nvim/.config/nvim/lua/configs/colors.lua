-- lua/configs/colors.lua

-- Gruvbox Material settings
vim.g.gruvbox_material_transparent_background = 1
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_foreground = "material"

vim.cmd.colorscheme("gruvbox-material")

-- Helper to clear backgrounds
local function clear_bg(group)
  vim.api.nvim_set_hl(0, group, { bg = "none" })
end

-- Core transparent groups
local transparent_groups = {
  "Normal",
  "NormalNC",
  "SignColumn",
  "EndOfBuffer",
  "LineNr",
  "CursorLineNr",

  -- Floating windows
  "NormalFloat",
  "FloatBorder",

  -- Neo-tree
  "NeoTreeNormal",
  "NeoTreeNormalNC",
  "NeoTreeEndOfBuffer",
}

for _, group in ipairs(transparent_groups) do
  clear_bg(group)
end

-- Slight tint for floats (readability)
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1d2021", blend = 10 })

-- Reapply on colorscheme change
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    for _, group in ipairs(transparent_groups) do
      clear_bg(group)
    end
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1d2021", blend = 10 })
  end,
})

