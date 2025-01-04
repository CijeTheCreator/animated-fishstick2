local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    { import = "lazyvim.plugins.extras.linting.eslint" },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
require("../custom/remaps")
require("luasnip").filetype_extend("typescriptreact", { "typescriptreact" })
require("../custom/snippets/prisma")
require("../custom/snippets/basic")
require("../custom/snippets/nextjs")
require("extract_symbols")
require("extract_text")

function _G.trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end
function _G.put(...)
  local objects = {}
  for i = 1, select("#", ...) do
    local v = select(i, ...)
    table.insert(objects, vim.inspect(v))
  end

  return table.concat(objects, "\n")
end
function _G.ClearLog()
  local filepath = "./debug"
  local file = io.open(filepath, "w")
  if file then
    file:write("")
    file:close()
  else
    print("Could not clear debug")
  end
end
function _G.Log(log)
  local filepath = "./debug2"
  local file = io.open(filepath, "a")
  if file then
    file:write(log)
    file:close()
    print("Text data saved to " .. filepath)
  else
    print("Error: Could not save to " .. filepath)
  end
end
function _G.read_json(filepath)
  local file = io.open(filepath, "rb")
  if not file then
    return nil
  end
  local jsonString = file:read("*a")
  file:close()
  return vim.json.decode(jsonString)
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "txt" },
  callback = function()
    vim.opt_local.spell = false
  end,
})
