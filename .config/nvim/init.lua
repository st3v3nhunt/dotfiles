vim.cmd([[set runtimepath^=~/.vim runtimepath+=~/.vim/after]])
vim.cmd([[let &packpath=&runtimepath]])
vim.cmd([[source ~/.vimrc]])

require('abbrev')
require('mappings')
require('settings')

vim.api.nvim_set_option('inccommand','split')                                  -- show split preview of all changes
-- call v:lua.require'lspconfig'.tsserver.setup({})
