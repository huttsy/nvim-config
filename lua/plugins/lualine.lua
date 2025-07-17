return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    event = "BufReadPre", -- load on buffer read
    config = function()
        -- try to require lsp‑progress, but don’t error if it’s not installed
        local has_progress, lsp_progress = pcall(require, "lsp-progress")

        require("lualine").setup({
            options = { theme = "catppuccin" },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch" },
                lualine_c = {
                    { "filename", path = 1 },
                    -- only show this component if lsp‑progress is available & non‑empty
                    {
                        function()
                            return has_progress and lsp_progress.progress() or ""
                        end,
                        cond = function()
                            return has_progress and lsp_progress.progress() ~= ""
                        end,
                        color = { fg = "#ffffff", bg = "#61afef" },
                    },
                },
                lualine_x = {
                    {
                        "diagnostics",
                        sources = { "nvim_lsp" },
                        sections = { "error", "warn", "info", "hint" },
                        symbols = { error = " ", warn = " ", info = " ", hint = " " },
                        colored = true,
                    },
                    "encoding",
                    "fileformat",
                    "filetype",
                },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
        })

        -- make sure lualine updates when LSP progress ticks
        vim.api.nvim_create_augroup("LspProgressLualine", { clear = true })
        vim.api.nvim_create_autocmd("User", {
            group = "LspProgressLualine",
            pattern = "LspProgressStatusUpdated",
            callback = function()
                require("lualine").refresh()
            end,
        })
    end,
}
