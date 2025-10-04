return {
  -- Core editor enhancements
  { 'editorconfig/editorconfig-vim' },
  { 'godlygeek/tabular' },
  { 'junegunn/vim-easy-align' },
  { 'ntpeters/vim-better-whitespace' },
  { 'tpope/vim-commentary' },
  { 'tpope/vim-obsession' },
  { 'tpope/vim-repeat' },
  { 'tpope/vim-surround' },
  { 'vim-autoformat/vim-autoformat' },

  -- Autopairs
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup({})
    end,
  },
}
