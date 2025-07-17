return {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre", -- lazy‑load on buffer read
    opts = {
        -- signs in the signcolumn
        signcolumn = true,
        -- highlight changed line numbers
        numhl = true,
        -- inline blame (with 500ms delay)
        current_line_blame = true,
        current_line_blame_opts = {
            virt_text = true,
            virt_text_pos = "eol",
            delay = 500,
        },
        -- watch for gitdir changes (e.g. worktree switches)
        watch_gitdir = {
            interval = 1000,
            follow_files = true,
        },

        -- buffer‑local mappings and actions
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns
            local function map(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
            end

            -- navigate hunks
            map("n", "]c", function()
                if vim.wo.diff then
                    return "]c"
                end
                gs.next_hunk()
            end, "Next Hunk")
            map("n", "[c", function()
                if vim.wo.diff then
                    return "[c"
                end
                gs.prev_hunk()
            end, "Prev Hunk")

            -- stage & reset hunks
            map("n", "<leader>hs", gs.stage_hunk, "Stage Hunk")
            map("v", "<leader>hs", function()
                gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, "Stage Hunk (visual)")
            map("n", "<leader>hr", gs.reset_hunk, "Reset Hunk")
            map("v", "<leader>hr", function()
                gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
            end, "Reset Hunk (visual)")
            map("n", "<leader>hu", gs.undo_stage_hunk, "Undo Stage Hunk")

            -- preview, blame, diff
            map("n", "<leader>hp", gs.preview_hunk, "Preview Hunk")
            map("n", "<leader>hb", gs.blame_line, "Blame Line")
            map("n", "<leader>tb", gs.toggle_current_line_blame, "Toggle Blame")
            map("n", "<leader>hd", gs.diffthis, "Diff This Hunk")
            map("n", "<leader>hD", function()
                gs.diffthis("~")
            end, "Diff Against Index")

            -- toggle showing deleted lines
            map("n", "<leader>td", gs.toggle_deleted, "Toggle Deleted")
        end,
    },
}
