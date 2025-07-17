local quotes = {
    "It's dangerous to go alone! Take this: proper error handling.",
    "War. War never changes… but your codebase does.",
    "The cake is a lie? No—the bug actually is.",
    "Finish refactoring!",
    "Stay awhile and listen… to my commit messages.",
    "Wah ha ha! I fixed another merge conflict.",
    "I used to be an adventurer like you, then I debugged a null pointer.",
    "Our princess is in another castle… waiting for CI to pass.",
    "Praise the Sun… and your test coverage.",
    "Bring me code reviews!",
    "Let's‑a go refactor!",
    "The Right Man in the Wrong Place can make all the difference… same for the right function in the wrong module.",
}

math.randomseed(os.time())
local quote = quotes[math.random(#quotes)]

local padding = 2
local width = #quote + padding * 2
local top = "╭" .. string.rep("─", width) .. "╮"
local middle = "│" .. string.rep(" ", padding) .. quote .. string.rep(" ", padding) .. "│"
local bottom = "╰" .. string.rep("─", width) .. "╯"

local header = {
    top,
    middle,
    bottom,
    "",
    "",
}

return {
    {
        "glepnir/dashboard-nvim",
        event = "VimEnter",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("dashboard").setup({
                theme = "hyper",
                config = {
                    header = header,
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
