return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp",

  config = function()
    local ls = require("luasnip")
    ls.config.set_config({
      history = true,
      enable_autosnippets = true,
      updateevents = "TextChanged,TextChangedI",
    })

    require("luasnip.loaders.from_lua").lazy_load({
      paths = vim.fn.stdpath("config") .. "/lua/snippets"
    })

    ls.filetype_extend("markdown", { "tex" })
    ls.filetype_extend("typst", { "tex" })
  end,
}

