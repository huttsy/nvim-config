return {
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function()
      require("lsp_signature").setup({
        bind = true,                -- automatically bind the signature to LSP
        handler_opts = {
          border = "rounded",       -- nice rounded window
        },
        hint_enable = true,         -- show parameter hints inline
        hi_parameter = "CursorLine",-- highlight current param
      })
    end,
  },
}
