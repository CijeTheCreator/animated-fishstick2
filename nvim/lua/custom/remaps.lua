vim.keymap.set("n", "<Space>r", "<CMD>:lua LspRename()<CR>", { desc = "Rename the current symbol" })
vim.keymap.set("n", "<Space>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<Space>E", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<leader>o", "o<Esc>", { desc = "Create empty line below" })
vim.keymap.set("n", "<leader>O", "O<Esc>", { desc = "Create empty line above" })
vim.keymap.set("n", "<leader>d", '"_dd', { desc = "Delete to Oblivion" })

vim.keymap.set("n", "<leader>j", "<CMD>cnext<CR>zz", { desc = "Forward qfix list" })
vim.keymap.set("n", "<leader>k", "<CMD>cprev<CR>zz", { desc = "Backward qfix list" })

vim.keymap.set("n", "<leader>fx", "<CMD>!chmod +x %<CR>", { desc = "Add exec permissions" })

-- Navigating examples/references
vim.keymap.set(
  "n",
  "<leader>m1",
  "<CMD>vsp /home/chijioke-akaolisa-osadebe/devchallenges/penpot/penpot-plugins-samples/create-text/src/main.ts<CR>zz",
  { desc = "Go to Penpot Example - Create Text proect" }
)
vim.keymap.set(
  "n",
  "<leader>m2",
  "<CMD>vsp /home/chijioke-akaolisa-osadebe/archives/Repod/app/components/ViewSummary.tsx<CR>zz",
  { desc = "Go to Repod Project" }
)
vim.keymap.set(
  "n",
  "<leader>m3",
  "<CMD>vsp /home/chijioke-akaolisa-osadebe/devchallenges/brightdata/references/LeafGPT-FE/src/App.tsx<CR>zz",
  { desc = "Go to LeafGPT Frontend" }
)
vim.keymap.set(
  "n",
  "<leader>m4",
  "<CMD>vsp /home/chijioke-akaolisa-osadebe/devchallenges/brightdata/references/LeafGPT-BE/src/routers/chat.ts<CR>zz",
  { desc = "Go to LeafGPT Reference" }
)
vim.keymap.set(
  "n",
  "<leader>m5",
  "<CMD>vsp /home/chijioke-akaolisa-osadebe/devchallenges/penpot/FINISHED-PROJECTS/activity-tracker-backend/app/index.ts<CR>zz",
  { desc = "Go to Activity Tracker Project Backend" }
)
vim.keymap.set(
  "n",
  "<leader>m6",
  "<CMD>vsp /home/chijioke-akaolisa-osadebe/devchallenges/brightdata/references/nextjs14-chatgpt/app/chat/[chatId]/page.tsx<CR>zz",
  { desc = "Chat GPT Reference" }
)
vim.keymap.set(
  "n",
  "<leader>m7",
  "<CMD>vsp /home/chijioke-akaolisa-osadebe/devchallenges/penpot/penpot-copilot/index.html<CR>zz",
  { desc = "Go to Copilot Project" }
)
-- /home/chijioke-akaolisa-osadebe/devchallenges/brightdata/references/google-clone-nextjs-tailwind
-- The Primeagen
vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true })

-- Treesitter Context
vim.keymap.set("n", "[c", function()
  require("treesitter-context").go_to_context(vim.v.count1)
end, { silent = true })

-- Entering Brackets
vim.api.nvim_set_keymap("n", '<leader><CR>"', 'vi"o<Esc>a', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><CR>(", "vi(o<Esc>a", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><CR>[", "vi[o<Esc>a", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><CR>'", "vi'o<Esc>a", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><CR>`", "vi`o<Esc>a", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><CR>{", "vi{o", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><CR><", "vi<o<Esc>a", { noremap = true, silent = true })

-- live rename stuff
local live_rename = require("live-rename")

-- the following are equivalent
vim.keymap.set("n", "<leader>r", live_rename.map({ text = "", insert = true }), { desc = "LSP rename" })
