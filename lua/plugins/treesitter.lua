return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "typescript", "tsx", "javascript", "python", "rust", "lua" },
                highlight = { enable = true },
                -- enable incremental selection
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<leader>si", -- start selection
                        node_incremental = "<leader>se", -- expand to next node
                        node_decremental = "<leader>sd", -- shrink to previous node
                    },
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true, -- jump forward to textobj
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@conditional.outer",
                            ["ic"] = "@conditional.inner",
                            ["al"] = "@loop.outer",
                            ["il"] = "@loop.inner",
                        },
                    },
                    move = {
                        enable = true,
                        set_jumps = true, -- add to jumplist
                        goto_next_start = {
                            ["]f"] = "@function.outer",
                            ["]c"] = "@conditional.outer",
                        },
                        goto_previous_start = {
                            ["[f"] = "@function.outer",
                            ["[c"] = "@conditional.outer",
                        },
                    },
                },
            })
        end,
    },
}
