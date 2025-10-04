return {
  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = { 'TroubleToggle', 'Trouble' },
    keys = {
      { '<leader>t', ':TroubleToggle<cr>', desc = 'Toggle Trouble' },
    },
  },
}
