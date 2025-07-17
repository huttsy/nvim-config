return {
  { 'williamboman/mason.nvim',       config = true },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({ ensure_installed = { 'ts_ls' } })
    end,
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      local lspconfig = require('lspconfig')
      local on_attach = function(client, bufnr)
        local opts = { noremap=true, silent=true }
        vim.api.nvim_buf_set_keymap(bufnr,'n','gd','<cmd>lua vim.lsp.buf.definition()<CR>',opts)
        vim.api.nvim_buf_set_keymap(bufnr,'n','K','<cmd>lua vim.lsp.buf.hover()<CR>',opts)
        vim.api.nvim_buf_set_keymap(bufnr,'n','<leader>r','<cmd>lua vim.lsp.buf.rename()<CR>',opts)
        vim.keymap.set('n','<leader>ih', function()
          local inlay_on = vim.lsp.inlay_hint.is_enabled(nil, bufnr)
          vim.lsp.inlay_hint.enable(
            not inlay_on,
            nil,
            bufnr
          )
          vim.cmd('redraw!')
          vim.notify(
            ("Inlay hints %s"):format(not inlay_on and "enabled" or "disabled"),
            vim.log.levels.INFO,
            { title = "LSP" }
          )
        end, { buffer = bufnr }) 
      end
      require("lspconfig").ts_ls.setup({
  on_attach = on_attach,
  settings = {
    javascript = {
      inlayHints = {
        includeInlayEnumMemberValueHints            = true,
        includeInlayFunctionLikeReturnTypeHints     = true,
        includeInlayFunctionParameterTypeHints      = true,
        includeInlayParameterNameHints              = "all",    -- "none" | "literals" | "all"
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints    = true,
        includeInlayVariableTypeHints               = true,
      },
    },
    typescript = {
      inlayHints = {
        includeInlayEnumMemberValueHints            = true,
        includeInlayFunctionLikeReturnTypeHints     = true,
        includeInlayFunctionParameterTypeHints      = true,
        includeInlayParameterNameHints              = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints    = true,
        includeInlayVariableTypeHints               = true,
      },
    },
  },
})
    end,
  },
}
