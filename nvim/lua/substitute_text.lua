local ts_utils = require("nvim-treesitter.ts_utils")
local api = vim.api

local function substitute(sub_table, current_text, node, bufnr)
  local parent_node = node:parent()
  local parent_tag = ""

  while parent_node:type() ~= "jsx_element" do
    parent_node = node:parent()
  end
  -- Check if parent is a `jsx_element` and retrieve the tag name
    for child in parent_node:iter_children() do
      if child:type() == "jsx_opening_element" then
        local tag_node = child:field("name")[1]
        if tag_node then
          parent_tag = ts_utils.get_node_text(tag_node, bufnr)[1]
        end
      break
      end
    end
for key, value in pairs(sub_table) do
  if parent_tag ~= value['parent_node'] then goto continue end
  if trim(current_text) == value['text'] then
    local start_row, start_col, end_row, end_col = vim.treesitter.get_node_range(node)
    vim.api.nvim_buf_set_text(bufnr, start_row, start_col, end_row, end_col, { value['parent_node'] })
    break
  end
::continue::
end
end


-- Function to get text and specific parent node tag name
local function get_text_and_substitute_replacement(bufnr, node, symbols_path)
  local subustitution_table = read_json(symbols_path)
  local text = vim.treesitter.get_node_text(node, bufnr) or ""
  substitute(subustitution_table, text, node, bufnr)
end

-- Command implementation
local function subsitute_text_command(args)
  local symbols_path = args.args
  local bufnr = api.nvim_get_current_buf()
  local parser = vim.treesitter.get_parser(bufnr, "tsx")
  local root = parser:parse()[1]:root()

  -- Traverse all nodes in the buffer to find jsx_text nodes
  local function traverse(node)
    if node:type() == "jsx_text" then
      get_text_and_substitute_replacement(bufnr, node, symbols_path)
    end

    -- Recurse through children
    for child in node:iter_children() do
      traverse(child)
    end
  end
  traverse(root)
end
-- Register the command in Neovim
api.nvim_create_user_command("SubstituteText", subsitute_text_command, {
  nargs = 1,
  complete = "file",
  desc = "Extract inner text of JSX components and save to JSON file",
})
