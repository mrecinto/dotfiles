local registry = require("themes.registry")

local themes = {}
local background_map = {}

for _, theme in ipairs(registry) do
  for _, scheme in ipairs(theme.schemes) do
    table.insert(themes, scheme)

    -- infer background per scheme
    if scheme:find("day") or scheme:find("light") then
      background_map[scheme] = "light"
    else
      background_map[scheme] = theme.background or "dark"
    end
  end
end

require("themery").setup({
  themes = themes,
  livePreview = true,
})

-- Fix background when switching themes
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    local scheme = vim.g.colors_name
    local bg = background_map[scheme]
    if bg then
      vim.opt.background = bg
    end
  end,
})

