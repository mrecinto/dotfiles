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

    -- 🔹 ADD KEYMAPS HERE
    vim.keymap.set({ "i", "s" }, "<C-k>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-j>", function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, { silent = true })
  end,
}

