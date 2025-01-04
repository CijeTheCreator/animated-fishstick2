local ts_utils = require("nvim-treesitter.ts_utils")
local api = vim.api
-- Function to get text and specific parent node tag name
local function get_text_and_parent_tag(bufnr, node)
  local text = vim.treesitter.get_node_text(node, bufnr) or ""
  local trimmed_text = trim(text)
  -- Traverse up to get the actual tag name
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
       -- break
      end
    end

  return { parent_node = parent_tag, text = trimmed_text }
end

-- Command implementation
local function save_text_to_json(args)
  local bufnr = api.nvim_get_current_buf()
  local parser = vim.treesitter.get_parser(bufnr, "tsx")
  local root = parser:parse()[1]:root()
  local results = {}

  -- Traverse all nodes in the buffer to find jsx_text nodes
  local function traverse(node)
    if node:type() == "jsx_text" then
      local text_info = get_text_and_parent_tag(bufnr, node)
      if text_info then
        table.insert(results, text_info)
      end
    end

    -- Recurse through children
    for child in node:iter_children() do
      traverse(child)
    end
  end
  traverse(root)

  -- Encode to JSON and save to file
  local json_data = vim.fn.json_encode(results)
  local filepath = args.args
  local file = io.open(filepath, "w")
  if file then
    file:write(json_data)
    file:close()
    print("Text data saved to " .. filepath)
  else
    print("Error: Could not save to " .. filepath)
  end
end
-- Register the command in Neovim
api.nvim_create_user_command("SaveTextToJson", save_text_to_json, {
  nargs = 1,
  complete = "file",
  desc = "Extract inner text of JSX components and save to JSON file",
})
