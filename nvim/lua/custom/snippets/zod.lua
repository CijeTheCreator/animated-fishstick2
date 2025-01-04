
local luasnip = require("luasnip")

local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local fmt = require("luasnip.extras.fmt").fmt

luasnip.add_snippets("typescript", {
  s("zS", fmt([[
  const {}Schema = {}
  ]], {
    i(1, ""), i(2, "")
  })),
})
luasnip.add_snippets("typescript", {
  s("zps", fmt([[
  z.string()
  ]], {
  })),
})
luasnip.add_snippets("typescript", {
  s("zpn", fmt([[
  z.number()
  ]], {
  })),
})
luasnip.add_snippets("typescript", {
  s("zpb", fmt([[
  z.boolean()
  ]], {
  })),
})
luasnip.add_snippets("typescript", {
  s("zpd", fmt([[
  z.date()
  ]], {
  })),
})
luasnip.add_snippets("typescript", {
  s("zps", fmt([[
  z.symbol()
  ]], {
  })),
})
luasnip.add_snippets("typescript", {
  s("zpu", fmt([[
  z.undefined()
  ]], {
  })),
})
luasnip.add_snippets("typescript", {
  s("zpnull", fmt([[
  z.null()
  ]], {
  })),
})
luasnip.add_snippets("typescript", {
  s("zpv", fmt([[
  z.void()
  ]], {
  })),
})
luasnip.add_snippets("typescript", {
  s("zparr", fmt([[
  z.array({})
  ]], {
    i(1, "")
  })),
})
luasnip.add_snippets("typescript", {
  s("zpo", fmt([[
  z.object({{
    {} : {},
  }})
  ]], {
    i(1, ""), i(2, "")
  })),
})
luasnip.add_snippets("typescript", {
  s("zsp", fmt([[
  {}.safeParse({});
  ]], {
    i(1, ""), i(2, "")
  })),
})
luasnip.add_snippets("typescript", {
  s("zspi", fmt([[
  const {a} = {}.safeParse({});
  if (!{a}.success) {{
    ({a}.error)
    return
  }}
  ({a}.data)
  ]], {
    a = i(1, ""), i(2, ""), i(3, "")

  }, {repeat_duplicates = true})),
})
luasnip.add_snippets("typescript", {
  s("zi", fmt([[
  type {a} = z.infer<typeof {a}>;
  ]], {
    a = i(1, "")
  }, {repeat_duplicates = true})),
})
luasnip.add_snippets("typescript", {
  s("zie", fmt([[
  export type {a} = z.infer<typeof {a}>;
  ]], {
    a = i(1, "")
  }, {repeat_duplicates = true})),
})



