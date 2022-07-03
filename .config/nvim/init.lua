vim.cmd([[set runtimepath^=~/.vim runtimepath+=~/.vim/after]])
vim.cmd([[let &packpath=&runtimepath]])
vim.cmd([[source ~/.vimrc]])

-- Map leader early so it takes affect in other files
vim.g.mapleader=","

require('plugins')
require('user')

vim.api.nvim_set_option('inccommand','split')                                  -- show split preview of all changes
