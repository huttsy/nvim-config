return {
    {
        "nvimtools/none-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim", "nvimtools/none-ls-extras.nvim" },
        event = "BufReadPre",
        config = function()
            local null_ls = require("null-ls")
            null_ls.setup({
                sources = {
                    -- JS/TS/React formatting via prettierd
                    null_ls.builtins.formatting.prettierd.with({
                        filetypes = {
                            "javascript",
                            "typescript",
                            "javascriptreact",
                            "typescriptreact",
                            "json",
                            "markdown",
                        },
                    }),
                    require("none-ls.diagnostics.eslint_d"),
                    require("none-ls.formatting.eslint"),
                    -- Python formatting
                    null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
                    -- Lua formatting via stylua
                    null_ls.builtins.formatting.stylua.with({
                        extra_args = {
                            "--indent-type",
                            "Spaces",
                            "--indent-width",
                            "4",
                        },
                    }),
                },
                on_attach = function(client, bufnr)
                    if client.server_capabilities.documentFormattingProvider then
                        local fmt_grp = vim.api.nvim_create_augroup("LspFormatting", { clear = false })

                        vim.api.nvim_clear_autocmds({ group = fmt_grp, buffer = bufnr })

                        vim.api.nvim_create_autocmd("BufWritePre", {
                            group = fmt_grp,
                            buffer = bufnr,
                            callback = function()
                                vim.lsp.buf.format({ bufnr = bufnr })
                            end,
                        })
                    end
                end,
            })
        end,
    },
}
