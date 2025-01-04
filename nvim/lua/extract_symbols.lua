local ts_utils = require'nvim-treesitter.ts_utils'
local ts_parsers = require'nvim-treesitter.parsers'
local api = vim.api

local function get_symbols()
  -- Get the language parser for the current buffer
  local bufnr = api.nvim_get_current_buf()
  local lang = ts_parsers.get_buf_lang(bufnr)
  local parser = ts_parsers.get_parser(bufnr, lang)

  local symbols = {}
  if parser then
    -- Use the Tree-sitter query to capture all symbols
    local query = vim.treesitter.query.parse(lang, "(identifier) @symbol")

    -- Parse the syntax tree to extract symbols
    for _, node, _ in query:iter_captures(parser:parse()[1]:root(), bufnr, 0, -1) do
      local symbol_name = ts_utils.get_node_text(node, bufnr)[1]
      table.insert(symbols, { symbol = symbol_name })
    end
  end

  return symbols
end

local function save_symbols_to_json(filename)
  local symbols = get_symbols()

  -- Convert symbols list to JSON format and save to file
  local json_symbols = vim.fn.json_encode(symbols)
  local file_path = vim.fn.expand(filename)
  local file = io.open(file_path, "w")
  if file then
    file:write(json_symbols)
    file:close()
    print("Symbols saved to " .. file_path)
  else
    print("Failed to write symbols to " .. file_path)
  end
end

-- Define a command that takes a filename argument
vim.api.nvim_create_user_command('SaveSymbolsToJson', function(opts)
  save_symbols_to_json(opts.args)
end, { nargs = 1 })  -- nargs = 1 ensures one argument (the filename) is required
