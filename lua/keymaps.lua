vim.g.mapleader = " "
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map(
    "n",
    "<leader>ff",
    "<cmd>lua require('telescope').extensions.frecency.frecency({workspace = 'CWD',prompt_title = 'Recent Files',})<CR>",
    opts
)
map("n", "<leader>fr", "<cmd>Telescope frecency<CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", opts)
map("n", "<leader>cu", "<cmd>GitBlameCopyCommitURL<CR>", opts)
map("v", "*", 'y/\\V<C-R>"<CR>', opts)
map("n", "<leader>ft", "<cmd>Lspsaga term_toggle<cr>", { desc = "Toggle Floating Terminal" })
map("n", "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "Toggle UndoTree" })
map("n", "<leader>ss", "<cmd>SessionSave<cr>", { desc = "Save Session" })
map("n", "<leader>sl", "<cmd>SessionRestore<cr>", { desc = "Restore Session" })
map("n", "<leader>sd", "<cmd>SessionDelete<cr>", { desc = "Delete Session" })
map("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { desc = "Saga Code Action" })
map("n", "<leader>ca", "<cmd>Lspsaga peek_definition<CR>", { desc = "Saga Definition Peek" })
