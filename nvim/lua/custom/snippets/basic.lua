local luasnip = require("luasnip")
local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local events = require("luasnip.util.events")
luasnip.add_snippets("typescript", {
  s(
    "constt",
    fmt(
      [[
  const {left} = {right}
  ]],
      {
        right = i(1, ""),
        left = i(2, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "dconst",
    fmt(
      [[
  const {{{left}}}= {right}
  ]],
      {
        right = i(1, ""),
        left = i(2, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "usS",
    fmt(
      [[
  const [{a}, set{a}] = useState<{}>({})
  ]],
      {
        i(1, "any"),
        i(2, ""),
        a = i(3, ""),
      },
      { repeat_duplicates = true }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "usR",
    fmt(
      [[
  const {left} = useRef{type}({right})
  ]],
      {
        right = i(1, ""),
        type = i(2, ""),
        left = i(3, ""),
      },
      { repeat_duplicates = true }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "adconst",
    fmt(
      [[
  const {{{left}}}= await {right}
  ]],
      {
        right = i(1, ""),
        left = i(2, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "aconst",
    fmt(
      [[
  const {left} = await {right}
  ]],
      {
        right = i(1, ""),
        left = i(2, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "econst",
    fmt(
      [[
  export const {left} = {right}
  ]],
      {
        right = i(1, ""),
        left = i(2, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "eaconst",
    fmt(
      [[
  export const {left} = await {right}
  ]],
      {
        right = i(1, ""),
        left = i(2, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "cls",
    fmt(
      [[
  console.log("{}")
  ]],
      {
        i(1, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "clv",
    fmt(
      [[
  console.log("{a}: ", {a})
  ]],
      {
        a = i(1, ""),
      },
      { repeat_duplicates = true }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "iff",
    fmt(
      [[
  if ({}) {{
    {}
  }}
  ]],
      {
        i(1, ""),
        i(2, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "ell",
    fmt(
      [[
  else {{
    {}
  }}
  ]],
      {
        i(1, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "eliff",
    fmt(
      [[
  else if ({}) {{
    {}
  }}
  ]],
      {
        i(1, ""),
        i(2, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "map",
    fmt(
      [[
  map(({}, {}) => {{
    {}
    return {}
  }})
  ]],
      {
        i(1, "value"),
        i(2, "index"),
        i(3, ""),
        i(4, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "cmap",
    fmt(
      [[
  const {dname} = {list}.map(({value}, {index}) => {{
    {inner}
    return {returnv}
  }})
  ]],
      {
        list = i(1, "list"),
        value = i(2, "value"),
        index = i(3, "index"),
        dname = i(4, ""),
        inner = i(5, ""),
        returnv = i(6, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "whilee",
    fmt(
      [[
  while ({condition}) {{
    {body}
    {variable}++
  }}
  ]],
      {
        condition = i(1, "condition"),
        variable = i(2, "variable"),
        body = i(3, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "intf",
    fmt(
      [[
  export interface {} {{
    {}
  }}
  ]],
      {
        i(1, ""),
        i(2, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "funn",
    fmt(
      [[
  function {}({}):{} {{
    {}
  }}
  ]],
      {
        i(1, ""),
        i(2, ""),
        i(3, ""),
        i(4, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "funnr",
    fmt(
      [[
  function {}({}):{} {{
    {}
    return {}
  }}
  ]],
      {
        i(1, ""),
        i(2, ""),
        i(3, ""),
        i(4, ""),
        i(5, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "cfunn",
    fmt(
      [[
  const {} = function ({}):{} {{
    {}
  }}
  ]],
      {
        i(1, ""),
        i(2, ""),
        i(3, ""),
        i(4, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "cfunnr",
    fmt(
      [[
  const {} = function ({}):{} {{
    {}
    return {}
  }}
  ]],
      {
        i(1, ""),
        i(2, ""),
        i(3, ""),
        i(4, ""),
        i(5, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "arrfunn",
    fmt(
      [[
  ({}) => {{
    {}
  }}
  ]],
      {
        i(1, ""),
        i(2, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "arrfunnr",
    fmt(
      [[
  ({}) => {{
    {}
    return {};
  }}
  ]],
      {
        i(1, ""),
        i(2, ""),
        i(3, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "ecfunn",
    fmt(
      [[
  export const {} = function ({}):{} {{
    {}
  }}
  ]],
      {
        i(1, ""),
        i(2, ""),
        i(3, ""),
        i(4, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "efunn",
    fmt(
      [[
  export function {}({}):{} {{
    {}
  }}
  ]],
      {
        i(1, ""),
        i(2, ""),
        i(3, ""),
        i(4, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "eafunn",
    fmt(
      [[
  export async function {}({}):{} {{
    {}
  }}
  ]],
      {
        i(1, ""),
        i(2, ""),
        i(3, ""),
        i(4, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "efunnr",
    fmt(
      [[
  export function {}({}):{} {{
    {}
    return {};
  }}
  ]],
      {
        i(1, ""),
        i(2, ""),
        i(3, ""),
        i(4, ""),
        i(5, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "eafunnr",
    fmt(
      [[
  export async function {}({}):{} {{
    {}
    return {};
  }}
  ]],
      {
        i(1, ""),
        i(2, ""),
        i(3, ""),
        i(4, ""),
        i(5, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "ecfunnr",
    fmt(
      [[
  export const {} = function ({}):{} {{
    {}
    return {}
  }}
  ]],
      {
        i(1, ""),
        i(2, ""),
        i(3, ""),
        i(4, ""),
        i(5, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "ecafunnr",
    fmt(
      [[
  export const {} = async function ({}):{} {{
    {}
    return {}
  }}
  ]],
      {
        i(1, ""),
        i(2, ""),
        i(3, ""),
        i(4, ""),
        i(5, ""),
      }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
  s(
    "forr",
    fmt(
      [[
  for (let {a} = {}, {a} < {b}.length; {a}++) {{
    const {} = {b}[{a}]
    {} 
  }}
  ]],
      {
        a = i(1, "i"),
        b = i(2, "list"),
        i(3, "0"),
        i(4, ""),
        i(5, ""),
      },
      { repeat_duplicates = true }
    ),
    {
      callbacks = {
        [-1] = {
          [events.leave] = function()
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<esc>", true, false, true), "s", false)
          end,
        },
      },
    }
  ),
})
