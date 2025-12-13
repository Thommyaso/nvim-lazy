
local ls = require "luasnip"

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("typescriptreact", {
    s("ret", fmt("return (\n<View>\n{}\n</View>\n)", {i(0)} )),
})

