set nocompatible            " use vim settings
filetype off                " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'             " Vundle
Plugin 'scrooloose/nerdtree'              " file explorer
Plugin 'scrooloose/syntastic'             " linting
Plugin 'tpope/vim-surround'               " word/phrase surrounds
Plugin 'tpope/vim-commentary'             " comment out lines
Plugin 'ctrlpvim/ctrlp.vim'               " fuzzy file finder
Plugin 'mileszs/ack.vim'                  " file searching
Plugin 'ternjs/tern_for_vim'              " JS autocompletion
Plugin 'Valloric/YouCompleteMe'           " code completion engine
Plugin 'ntpeters/vim-better-whitespace'   " better whitespace
Plugin 'tomasr/molokai'                   " theme
Plugin 'vim-airline/vim-airline'          " file status bar
Plugin 'matchit.zip'                      " Use % in html
" Plugin 'Townk/vim-autoclose' " Auto pair/close - Disabled as it kept
" putting Vim into insert mode when there was a thing to auto complete
" Plugin 'jiangmiao/auto-pairs'             " Auto pair/close
" Plugin 'Raimondi/delimitMate'             " Auto pair/close

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

syntax on                     " syntax highlighting
colorscheme molokai           " theme

set autoindent                " auto indent
set clipboard=unnamed         " allow copy between instances
set number                    " line numbers
set relativenumber            " show relative line numbers
set colorcolumn=80            " 80 column guide
set tabstop=2                 " 2 space tabs
set expandtab                 " insert spaces with tab
set shiftwidth=2              " 2 spaces for tab with >
set incsearch                 " incremental search
set hlsearch                  " highlight searches
set t_Co=256                  " 256 colours
set list
set listchars=tab:▸\ ,eol:¬   " show white chars
set showcmd                   " show command on screen

au Bufread,BufNewFile *.nunjucks set filetype=html " set nunjucks files as html

" Plugin specifc settings
" NERDTree - Open automatically when starting
let NERDTreeShowHidden=1

map <C-n> :NERDTreeToggle<CR>


" CtrlP - Ignore VCS and node stuff
let g:ctrlp_custom_ignore = '\v[\/](coverage|node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_show_hidden = 1
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0

" Ack - use the_silver_searcher if avaiable
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


" Syntastic seetings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=0                    " toggle display of error list
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exec='eslint_d'
let g:syntastic_loc_list_height=3
let g:syntastic_error_symbol='🚨'
let g:syntastic_style_error_symbol='⁉️'
let g:syntastic_warning_symbol='⚠️'
let g:syntastic_style_warning_symbol='💩'

" Use global, static locations for back,swap and undo
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set undodir=~/.vim/tmp/undo//

" Easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Remap leader to comma
let mapleader=","

" Leaders
" Save and close
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
" Send Vim to background
nnoremap <Leader>z <C-z>

