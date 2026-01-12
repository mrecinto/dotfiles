local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {

  -- ===== Superscripts / subscripts =====
  s({ trig = "sr" }, t("^{2}")),
  s({ trig = "cb" }, t("^{3}")),

  s({ trig = "rd" },
    fmta("^{<>}", { i(1) })
  ),

  -- ===== Roots / fractions =====
  s({ trig = "sq" },
    fmta("\\sqrt{<>}", { i(1) })
  ),

  s({ trig = "//" },
    fmta("\\frac{<>}{<>}", { i(1), i(2) })
  ),

  -- ===== Logic =====
  s({ trig = "=>" }, t("\\implies")),
  s({ trig = "=<" }, t("\\impliedby")),
  s({ trig = "<->" }, t("\\leftrightarrow")),

  -- ===== Set theory =====
  s({ trig = "and" }, t("\\cap")),
  s({ trig = "orr" }, t("\\cup")),
  s({ trig = "inn" }, t("\\in")),
  s({ trig = "sub=" }, t("\\subseteq")),
  s({ trig = "eset" }, t("\\emptyset")),

  -- ===== Blackboard bold =====
  s({ trig = "NN" }, t("\\mathbb{N}")),
  s({ trig = "ZZ" }, t("\\mathbb{Z}")),
  s({ trig = "RR" }, t("\\mathbb{R}")),
  s({ trig = "CC" }, t("\\mathbb{C}")),

  -- ===== Environments =====
  s({ trig = "cases" },
    fmta([[
\\begin{cases}
<>
\\end{cases}
]], { i(1) })
  ),

  s({ trig = "align" },
    fmta([[
\\begin{align}
<>
\\end{align}
]], { i(1) })
  ),

  s({ trig = "beg" },
    fmta([[
\\begin{<>}
<>
\\end{<>}
]], { i(1), i(2), rep(1) })
  ),

}

