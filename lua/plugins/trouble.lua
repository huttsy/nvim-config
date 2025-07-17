return {
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = {
      "Trouble", "TroubleToggle", "TroubleRefresh", "TroubleClose",
      "TroubleToggleLoclist", "TroubleToggleQuickfix",
    },
    keys = {
      { "<leader>xx", "<cmd>TroubleToggle document_diagnostics<cr>", desc = "Trouble: Document Diagnostics" },
      { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Trouble: Workspace Diagnostics" },
    },
    opts = {
      position = "right",
      height   = 10,
      indent_lines = true,
      auto_open    = false,
      auto_close   = true,
      use_diagnostic_signs = true,
    },
    config = function(_, opts)
      require("trouble").setup(opts)
    end,
  },
}
