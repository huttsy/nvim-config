return {
    {
        "echasnovski/mini.nvim",
        version = false,
        lazy = false,
        config = function()
            local MiniMap = require("mini.map")
            MiniMap.setup({
                symbols = {
                    encode = MiniMap.gen_encode_symbols.dot("4x2"),
                },
            })
            MiniMap.open()
            local MiniDiff = require("mini.diff")
            MiniDiff.setup()
            local MiniSurround = require("mini.surround")
            MiniSurround.setup()
        end,
    },
}
