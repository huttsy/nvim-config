return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = "BufReadPre",
        opts = {
            exclude = {
                buftypes = { "terminal", "help" },
                filetypes = { "dashboard", "NvimTree", "lazy" },
            },
            indent = {
                char = "│",
                tab_char = "│",
                highlight = {
                    "RainbowRed",
                    "RainbowYellow",
                    "RainbowBlue",
                    "RainbowOrange",
                    "RainbowGreen",
                    "RainbowViolet",
                    "RainbowCyan",
                },
            },
        },
        config = function(_, opts)
            local ibl = require("ibl")
        end,
    },
}
