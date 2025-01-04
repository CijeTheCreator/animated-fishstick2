local luasnip = require("luasnip")
-- set keybinds for both INSERT and VISUAL.
vim.api.nvim_set_keymap("i", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-n>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
vim.api.nvim_set_keymap("s", "<C-p>", "<Plug>luasnip-prev-choice", {})
local fmt = require("luasnip.extras.fmt").fmt
local s = luasnip.snippet
local t = luasnip.text_node
local c = luasnip.choice_node
local i = luasnip.insert_node
luasnip.add_snippets("typescript", {
  s("pff", {
    t("await prisma."),
    i(1),
    t(".findFirst({"),
    t("where: { "),
    i(2),
    t(" : "),
    i(3),
    t(" },});"),
  }),
  s("pfm", { --prisma find many
    t("await prisma."),
    i(1),
    t(".findMany()"),
  }),
  s("pfmw", { --prisma find many
    t("await prisma."),
    i(1),
    t(".findMany({"),
    t("where: { "),
    i(2),
    t(" : "),
    i(3),
    t(" },});"),
  }),
  s("pc", { --prisma create
    t("await prisma."),
    i(1),
    t(".create({"),
    t(" data : "),
    i(2),
    t("});"),
  }),
  s("pd", { --prisma delete
    t("await prisma."),
    i(1),
    t(".delete({"),
    t("where: { "),
    i(2),
    t(" : "),
    i(3),
    t(" },});"),
  }),
  s("pu", { --prisma update
    t("await prisma."),
    i(1),
    t(".update ({"),
    t("where: { "),
    i(2),
    t(" : "),
    i(3),
    t(" },"),
    t(" data : "),
    i(4),
    t("  });"),
  }),
})

--TODO: Add String Ids later
luasnip.add_snippets("prisma", {
  s(
    "pm",
    fmt(
      [[
  model {} {{
    id         Int        @id @default(autoincrement())
    createdAt  DateTime   @default(now())
    updatedAt  DateTime   @updatedAt
    {}
    }}
  ]],
      {
        i(1, ""),
        i(2, ""),
      }
    )
  ),
  s(
    "pfi",
    fmt(
      [[
  {}          {}{}      {}
  ]],
      {
        i(1, ""),
        c(2, {
          t("Int"),
          t("String"),
          t("Boolean"),
          t("BigInt"),
          t("Float"),
          t("DateTime"),
          t("Json"),
          t("Bytes"),
          t("Unsupported"),
          i(nil, "Custom"),
        }),
        c(3, {
          t(""),
          t("[]"),
          t("?"),
          t("[]?"),
        }),
        c(4, {
          t(""),
          t("@id"),
          t("@@id"),
          t("@default"),
          t("@unique"),
          t("@@unique"),
          t("@@index"),
          t("@relation"),
          t("@map"),
          t("@@map"),
          t("@updatedAt"),
          t("@ignore"),
          t("@@ignore"),
          t("@@schema"),
        }),
      }
    )
  ),
  s(
    "pattr",
    fmt(
      [[
  {}
  ]],
      {
        c(1, {
          t("@relation"),
          t("@unique"),
          t("@@unique"),
          t("@id"),
          t("@@id"),
          t("@default"),
          t("@@index"),
          t("@map"),
          t("@@map"),
          t("@updatedAt"),
          t("@ignore"),
          t("@@ignore"),
          t("@@schema"),
        }),
      }
    )
  ),
})
