local o = vim.o
o.number = true
o.relativenumber = true
o.expandtab = true
o.shiftwidth = 2
o.tabstop = 2
o.smartindent = true
o.wrap = false
o.termguicolors = true
o.mouse = "a"
o.clipboard = "unnamedplus"

-- make CursorHold and key‑timeout feel snappier
o.updatetime = 300 -- how long (ms) before CursorHold fires
o.timeoutlen = 500 -- how long (ms) to wait for mapped sequence

-- persistent undo and no swap/backup clutter
o.swapfile = false
o.backup = false
o.undofile = true
o.undodir = vim.fn.stdpath("data") .. "/undo"

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

vim.api.nvim_set_hl(0, "LineNr", { fg = "#b8c0e0", bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#8aadf4", bg = "NONE", bold = true })

-- change the SEARCH highlight
vim.api.nvim_set_hl(0, "Search", { bg = "#004f5e", fg = "NONE" })
vim.api.nvim_set_hl(0, "IncSearch", { bg = "#004f5e", fg = "NONE" })

-- change the VISUAL selection highlight
vim.api.nvim_set_hl(0, "Visual", { bg = "#004f5e", fg = "NONE" })

-- if you want the popup menu selection too
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#004f5e", fg = "NONE" })

-- Yank highlight
vim.api.nvim_set_hl(0, "YankHighlight", {
    bg = "#9DEDB2",
    fg = "NONE",
})

vim.opt.signcolumn = "yes"

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "YankHighlight",
            timeout = 200,
        })
    end,
})
