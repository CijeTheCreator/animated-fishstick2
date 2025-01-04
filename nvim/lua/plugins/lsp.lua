return {
  {
    "neovim/nvim-lspconfig",
    init = function ()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys+1] = {
        "gd",
        function()
          vim.lsp.buf_request(0, "textDocument/definition", vim.lsp.util.make_position_params(), function(err, result, ctx, config)
            if err then
              print(err)
              return
            end
            local command = 'vsplit ' ..
            vim.uri_to_fname(result[1].uri)
            local line = "call cursor(" ..
            (result[1].range.start.line + 1) ..
            "," .. (result[1].range.start.character + 1) .. ")"
            vim.cmd(command)
            vim.cmd(line)
        end)
    end
  }
end
}
}
