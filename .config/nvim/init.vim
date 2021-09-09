set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc

set inccommand=split                                                           " show split preview of all changes
let g:loaded_perl_provider=0
let g:loaded_python_provider=0
let g:loaded_ruby_provider=0
let g:python_host_prog='~/.pyenv/shims/python'
let g:node_host_prog='/usr/local/bin/node'
