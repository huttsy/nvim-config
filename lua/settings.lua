local o = vim.o
o.number = true
o.relativenumber = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.smartindent = true
o.wrap = false
o.termguicolors = true
o.mouse = 'a'
o.clipboard = "unnamedplus"

local groups = {
  "Normal",
  "NormalNC",
  "NormalFloat",
  "SignColumn",
  "EndOfBuffer",
  "NvimTreeNormal",
}

for _, name in ipairs(groups) do
  vim.api.nvim_set_hl(0, name, { bg = "NONE" })
end

vim.api.nvim_set_hl(0, "LineNr",       { fg = "#b8c0e0", bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#8aadf4", bg = "NONE", bold = true })

-- change the SEARCH highlight
vim.api.nvim_set_hl(0, "Search",    { bg = "#004f5e", fg = "NONE" })
vim.api.nvim_set_hl(0, "IncSearch", { bg = "#004f5e", fg = "NONE" })

-- change the VISUAL selection highlight
vim.api.nvim_set_hl(0, "Visual",    { bg = "#004f5e", fg = "NONE" })

-- if you want the popup menu selection too
vim.api.nvim_set_hl(0, "PmenuSel",  { bg = "#004f5e", fg = "NONE" })

vim.opt.signcolumn = "yes"

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
