return {
  {
    'nvim-telescope/telescope-frecency.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'tami5/sqlite.lua',
    },
    config = function()
      require('telescope').setup {
        extensions = {
          frecency = {
            show_unindexed = true,
            ignore_patterns = { '*/.git/*', '*/node_modules/*', '*/tmp/*' },
          },
        },
      }
      require('telescope').load_extension('frecency')
    end,
  },
}

