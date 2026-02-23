local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local rep = require("luasnip.extras").rep

return {
  s("fig", {
    t({ "#figure(", "  image(\"fig/" }),
    i(1, "label"),
    t({ ".svg\")," , "  caption: [" }),
    i(2, "Caption"),
    t({ "]," , ") <" }),
    rep(1),
    t({ ">" }),
  }),
}

