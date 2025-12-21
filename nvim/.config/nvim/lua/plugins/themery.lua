local registry = require("themes.registry")

local themes = {}
for _, entry in ipairs(registry) do
  for _, scheme in ipairs(entry.schemes) do
    table.insert(themes, scheme)
  end
end

return {
  "zaldih/themery.nvim",
  cmd = "Themer",
  config = function()
    require("themery").setup({
      themes = themes,
      livePreview = true,
    })
  end,
}

