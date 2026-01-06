-- return{
-- 	"L3MON4D3/LuaSnip",
-- 	-- follow latest release.
-- 	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
-- 	-- install jsregexp (optional!).
-- 	build = "make install_jsregexp"
-- }
return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",

  init = function()
    require("luasnip.loaders.from_lua").lazy_load({
      paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
    })
  end,

  opts = {
    history = true,
    enable_autosnippets = true,
    updateevents = "TextChanged,TextChangedI",
  },
}

