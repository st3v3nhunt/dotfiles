vim.cmd([[set runtimepath^=$HOME/.vim runtimepath+=$HOME/.vim/after]])
vim.cmd([[let &packpath=&runtimepath]])
vim.cmd([[source $HOME/.vimrc]])

if vim.g.vscode then
  print('Loading VS Code settings...')
  vim.cmd([[source $HOME/.config/nvim/vscode/settings.vim]])
end
-- Map leader early so it takes affect in other files
vim.g.mapleader=","

require('plugins')
require('user')

vim.api.nvim_set_option('inccommand','split')                                  -- show split preview of all changes
