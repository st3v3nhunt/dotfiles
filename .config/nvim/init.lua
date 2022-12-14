vim.cmd([[set runtimepath^=$HOME/.vim runtimepath+=$HOME/.vim/after]])
vim.cmd([[let &packpath=&runtimepath]])
vim.cmd([[source $HOME/.vimrc]])

-- Map leader early so it takes affect in other files
vim.g.mapleader = ","

if vim.g.vscode then
  print('Loading VS Code settings...')
  vim.cmd([[source $HOME/.config/nvim/vscode/settings.vim]])
else
  require('plugins')
end

require('user')

-- show split preview of all changes
vim.api.nvim_set_option('inccommand', 'split')
-- use internal formatting for bindings like gq.
-- [source](https://github.com/jose-elias-alvarez/null-ls.nvim/issues/1131#issuecomment-1268760653)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.bo[args.buf].formatexpr = nil
  end,
})
