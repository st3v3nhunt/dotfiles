return {
  { 'christoomey/vim-tmux-navigator' },
  {
    'github/copilot.vim',
    config = function()
      -- Copilot accept with Ctrl-J
      vim.g.copilot_no_tab_map = true
    end,
  },
  { 'ludovicchabant/vim-gutentags' },
}
