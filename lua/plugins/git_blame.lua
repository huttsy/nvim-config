return {
    "f-person/git-blame.nvim",
    lazy = false,
    opts = {
        enabled = true,
        message_template = " <summary> • <date> • <author> • <<sha>>",
        date_format = "%m-%d-%Y %H:%M:%S",
        virtual_text_column = 1,
        gitblame_clipboard_register = "unnamedplus"
    },
}
