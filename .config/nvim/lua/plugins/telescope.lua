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
