return {
    {
        "glepnir/lspsaga.nvim",
        branch = "main",
        event = "LspAttach",
        config = function()
            require("lspsaga").setup({})
        end,
    },
}
