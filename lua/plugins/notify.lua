return {
  {
    "rcarriga/nvim-notify",
    version = false,
    lazy = false,
    config = function()
      local notify = require("notify")
      notify.setup({
        stages  = "slide",
        timeout = 3000,
        render  = "default",
        fps     = 30,
        on_open = function(win)
          local cfg = vim.api.nvim_win_get_config(win)
          cfg.anchor = "NE"
          cfg.row    = 1
          cfg.col    = vim.o.columns - 1
          vim.api.nvim_win_set_config(win, cfg)
        end,
      })
      vim.notify = notify
    end,
  },
}
