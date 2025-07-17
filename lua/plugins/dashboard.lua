return {
    {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("dashboard").setup({
                theme = "hyper",
                config = {
                    week_header = { enable = true },
                    shortcut = {
                        { icon = "  ", desc = "Recent Session", action = "SessionRestore" },
                        { icon = "  ", desc = "Find File   ", action = "Telescope find_files" },
                        { icon = "  ", desc = "New File    ", action = "ene | startinsert" },
                        { icon = "  ", desc = "Bookmarks   ", action = "Telescope marks" },
                        { icon = "  ", desc = "Config      ", action = "edit ~/.config/nvim/init.lua" },
                    },
                },
            })
        end,
    },
}
