
local registry = require("themes.registry")

local plugins = {}

for _, theme in ipairs(registry) do
  table.insert(plugins, {
    theme.repo,     -- GitHub repo
    name = theme.name,
    lazy = true,    -- themes load on demand
  })
end

return plugins

