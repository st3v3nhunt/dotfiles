return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'Telescope',
    keys = {
      { '<C-p>', mode = 'n' },
      { '\\', mode = 'n' },
      { 'K', mode = 'n' },
      { '<leader>fb', mode = 'n' },
    },
    config = function()
      require('telescope').setup({
        defaults = {
          vimgrep_arguments = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
            '--iglob',
            '!.git',
          },
        },
      })

      local setKeyMap = vim.keymap.set
      setKeyMap('n', '<C-p>',
        "<cmd>lua require'telescope.builtin'.find_files({find_command={'rg','--hidden','--files','--iglob','!.git'}})<cr>")
      setKeyMap('n', '\\', "<cmd>lua require'telescope.builtin'.live_grep()<cr>")
      setKeyMap('n', 'K', "<cmd>lua require'telescope.builtin'.grep_string()<cr>")
      setKeyMap('n', '<leader>fb', "<cmd>lua require'telescope.builtin'.buffers()<cr>")
    end,
  },
}
