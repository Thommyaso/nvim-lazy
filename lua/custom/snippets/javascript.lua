-- require("luasnip.session.snippet_collection").clear_snippets "javascript"

local ls = require "luasnip"

local s = ls.snippet
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("javascript", {
    s("obj", fmt("{} = {{{}}}", {i(1), i(0)} )),
    s("arr", fmt("{} = [{}]", {i(1), i(0)} )),
    s("fa", fmt("{} = ({}) => {{\n{}\n}}\n\n", {i(1), i(2), i(0)} ))
})

ls.filetype_extend("javascriptreact", {"javascript"})
ls.filetype_extend("typescriptreact", {"javascript"})
ls.filetype_extend("typescript", {"javascript"})
