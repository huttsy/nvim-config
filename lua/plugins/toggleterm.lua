return {
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup({
                size = 20,
                open_mapping = [[<c-\>]],
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = 2,
                start_in_insert = true,
                insert_mappings = true,
                persist_size = true,
                direction = "float",
                float_opts = {
                    border = "curved",
                    winblend = 3,
                    highlights = { border = "Normal", background = "Normal" },
                },
            })
        end,
    },
}
