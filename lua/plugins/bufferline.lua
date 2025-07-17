return {
  {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('bufferline').setup{
        options = {
          indicator = { style = 'underline' },
          diagnostics = 'nvim_lsp',
          offsets = {{ filetype = 'NvimTree', text = '', padding = 1 }},
          show_buffer_close_icons = true,
          show_close_icon = false,
        }
      }
    end,
  },
}


