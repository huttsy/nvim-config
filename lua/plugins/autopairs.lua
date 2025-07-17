return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    dependencies = { "nvim-cmp" },
    config = function()
      local npairs = require("nvim-autopairs")
      npairs.setup({})
      -- integrate with nvim-cmp
      local cmp = require("cmp")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
