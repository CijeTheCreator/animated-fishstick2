return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<F5>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.select_next_item()
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        experimental = { ghost_text = true },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        confirmation = {
          completeopt = "menu,menuone,noinsert",
        },
        mapping = {
          ["<Up>"] = cmp.mapping.select_prev_item(),
          ["<Down>"] = cmp.mapping.select_next_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
          }),
        },
        -- ordered by priority
        sources = cmp.config.sources({
          { name = "luasnip" },
          { name = "nvim_lsp", keyword_length = 1 },
          { name = "nvim_lsp_signature_help" },
          { name = "path" },
          { name = "nvim_lua" },
        }, {
          { name = "buffer" },
        }),
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(), -- Tab for selection (arrows needed for selecting past items)
        sources = { { name = "buffer" } },
      })

      cmp.setup.cmdline({ ":" }, {
        mapping = cmp.mapping.preset.cmdline(), -- Tab for selection (arrows needed for selecting past items)
        sources = { { name = "cmdline" }, { name = "path" } },
      })
    end,
  },
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "hrsh7th/cmp-path",
  {
    "L3MON4D3/LuaSnip",
    lazy = false,
    dependencies = { "saadparwaiz1/cmp_luasnip" },
    keys = {
      {
        "<F5>",
        function()
          require("luasnip").jump(1)
        end,
        desc = "Jump forward a snippet placement",
        mode = { "i", "s" },
        noremap = true,
        silent = true,
      },
      {
        "<S-Tab>",
        function()
          require("luasnip").jump(-1)
        end,
        desc = "Jump backward a snippet placement",
        mode = { "i", "s" },
        noremap = true,
        silent = true,
      },
    },
    config = function()
      require("luasnip.loaders.from_lua").load({ paths = "~/.snippets" })
    end,
  },
}
