local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {

  -- Inline math (autosnippet)
  s(
    { trig = "mk", snippetType = "autosnippet" },
    { t("$"), i(1), t("$") }
  ),

  -- Display math (autosnippet)
  s(
    { trig = "dm", snippetType = "autosnippet" },
    {
      t({ "$$", "" }),
      i(1),
      t({ "", "$$" }),
    }
  ),

}

