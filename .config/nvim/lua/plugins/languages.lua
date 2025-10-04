return {
  -- Syntax highlighting and language support
  { 'kevinoid/vim-jsonc' },
  { 'towolf/vim-helm' },

  -- Language-specific plugins
  { 'elixir-editors/vim-elixir' },
  {
    'fatih/vim-go',
    ft = 'go',
    config = function()
      vim.g.go_fmt_command = 'goimports'
      vim.g.go_highlight_fields = 1
      vim.g.go_highlight_function_calls = 1
      vim.g.go_highlight_functions = 1
      vim.g.go_highlight_operators = 1
      vim.g.go_highlight_types = 1
    end,
  },
  {
    'hashivim/vim-terraform',
    config = function()
      vim.g.terraform_align = 1
      vim.g.terraform_fmt_on_save = 1
    end,
  },
  { 'leafgarland/typescript-vim' },
  { 'leafOfTree/vim-svelte-plugin' },
  { 'Glench/Vim-Jinja2-Syntax' },
  { 'pangloss/vim-javascript' },
  { 'posva/vim-vue' },
  {
    'rust-lang/rust.vim',
    config = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  { 'vim-ruby/vim-ruby' },
  { 'tpope/vim-rails' },
  {
    'mattn/emmet-vim',
    config = function()
      vim.g.user_emmet_leader_key = '<C-C>'
    end,
  },
}
