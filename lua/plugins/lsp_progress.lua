return {
    "linrongbin16/lsp-progress.nvim",
    event = "LspAttach", -- load when any LSP client attaches
    config = function()
        require("lsp-progress").setup()
    end,
}
