local luasnip = require("luasnip")

local s = luasnip.snippet
local t = luasnip.text_node
local i = luasnip.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local events = require("luasnip.util.events")

luasnip.add_snippets("typescript", {
  s(
    "Nxc",
    fmt(
      [[
  export default function {}({}) {{
    {}
    return {};
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
    "Nxs",
    fmt(
      [[
  export default async function {}({}) {{
    {}
    return {};
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
})
