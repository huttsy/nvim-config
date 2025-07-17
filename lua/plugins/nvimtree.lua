return {
  {
    'nvim-tree/nvim-tree.lua', dependencies = {'nvim-tree/nvim-web-devicons'},
    config = function()
      require('nvim-tree').setup({
        update_focused_file = {
           enable      = true,
           update_cwd  = true,
        },
        view = { 
          side = 'right',
          width = 50 
        } 
      })
    end,
  },
}
