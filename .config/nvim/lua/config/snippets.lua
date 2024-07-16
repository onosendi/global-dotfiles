local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local jsts = {
  s({
    trig = "cl",
    namr = "Console Log",
    dscr = "Log to console",
  }, {
    t("console.log("),
    i(1),
    t(")"),
  })
}

ls.add_snippets(nil, {
    javascript = jsts,
    typescript = jsts,
})
