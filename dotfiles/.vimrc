set nocompatible            " use vim settings
filetype off                " required
set path+=**                " make :find search everything
set tags=tags               " set tags to tags for ctags
set autowrite               " write file

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'             " Vundle should manage Vundle
" Themes
Plugin 'crusoexia/vim-monokai'
" generally useful plugins
Plugin 'airblade/vim-gitgutter'           " Git into in gutter
Plugin 'christoomey/vim-tmux-navigator'   " Same split shortcuts in vim and tmux
Plugin 'ctrlpvim/ctrlp.vim'               " Fuzzy file finder
Plugin 'junegunn/vim-easy-align'          " Better/easier alignment
Plugin 'ludovicchabant/vim-gutentags'     " Tag management
Plugin 'majutsushi/tagbar'                " A ctag viewer
Plugin 'mileszs/ack.vim'                  " File searching
Plugin 'ntpeters/vim-better-whitespace'   " Better whitespace
Plugin 'scrooloose/nerdtree'              " File explorer
Plugin 'tpope/vim-commentary'             " Comment out lines
Plugin 'tpope/vim-fugitive'               " Git wrapper
Plugin 'tpope/vim-obsession'              " Improve session restoration
Plugin 'tpope/vim-repeat'                 " Repeat plugin commands via .
Plugin 'tpope/vim-surround'               " Word/phrase surrounds
Plugin 'Valloric/YouCompleteMe'           " Code completion engine
Plugin 'vim-airline/vim-airline'          " File status bar
Plugin 'w0rp/ale'                         " Asynchronous Lint Engine aka ALE
" specific dev/languge plugins
Plugin 'fatih/vim-go'                     " Go development
Plugin 'google/yapf'                      " Python formatter
Plugin 'lepture/vim-jinja'                " Jinja/Nunjucks highlighting
Plugin 'rust-lang/rust.vim'               " rust.vim
" Plugin 'OmniSharp/omnisharp-vim'          " Provides IDE like abilities for C#
Plugin 'Chiel92/vim-autoformat'           " Generic code formatter
Plugin 'honza/vim-snippets'               " Snippets
Plugin 'hashivim/vim-terraform'           " Terraform formatter and highlighter
Plugin 'godlygeek/tabular'                " Tabularisation
Plugin 'leafgarland/typescript-vim'       " TS syntax
Plugin 'pangloss/vim-javascript'          " JS syntax
Plugin 'SirVer/ultisnips'                 " Snippet engine

" All plugins must be added before this line
call vundle#end()             " required

filetype plugin indent on     " required
syntax on                     " syntax highlighting
colorscheme monokai

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
set ignorecase                " ignore case when searching
set smartcase                 " ignore case if search term is all lower, else be case sensitive
set history=500               " remember more stuff
set undolevels=1000           " undo more stuff
set foldmethod=indent         " fold based on indentation
set foldlevel=5               " default fold level. 5 should be ok to see most contents

autocmd BufRead,BufNewFile *.nunjucks set filetype=html   " set nunjucks files as html
autocmd BufRead,BufNewFile *.md setlocal spell            " turn spell check on for *.md files
autocmd BufRead,BufNewFile Jenkinsfile set syntax=groovy  " Set Jenkinsfile snytax to groovy (for highlighting)

" Plugin specifc settings
" Save Terraform files on save and align with tabular
let g:terraform_align=1
let g:terraform_fmt_on_save=1
" Run rustfmt on save
let g:rustfmt_autosave=1
" Format on save
" autocmd BufWrite * :Autoformat
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" NERDTree settings
let NERDTreeShowHidden=1
let g:NERDTreeMapOpenSplit='h'
let g:NERDTreeMapOpenVSplit='v'
map <C-n> :NERDTreeToggle<CR>

" Better whitespace
let g:better_whitespace_enabled=1
let g:better_whitespace_filetypes_blacklist=[]
let g:strip_whitespace_on_save=1

" CtrlP - Ignore VCS and node stuff
let g:ctrlp_custom_ignore = '\v[\/](coverage|node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 1
let g:ctrlp_extensions = ['tag']

" Ack - use the_silver_searcher if avaiable
if executable('ag')
  " Use ag in place of ack
  let g:ackprg = 'ag --vimgrep'
endif

" Bind K to search for word under cursor
nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>
" Map Ack! to \
nnoremap \ :Ack!<space>

" vim-airline settings
let g:airline_powerline_fonts = 1
" only load these extensions to speed up loading
let g:airline_extension = ['ale']

" ALE configuration
let g:ale_sign_error='✗✗'
let g:ale_sign_warning='∆∆'
let g:airline#extensions#ale#enabled=1       " error information in the status bar
let g:ale_lint_on_save=1
let g:ale_fix_on_save=1
" Set standard as the only JS linter and fixer
let g:ale_linters={
\   'javascript': ['standard'],
\   'typescript': ['prettier'],
\}
let g:ale_fixers={
\   'javascript': ['standard'],
\   'typescript': ['prettier'],
\}
let g:ale_completion_enabled = 1
let g:ale_completion_tsserver_autoimport = 1

" vim-go configuration
let g:go_fmt_command='goimports'
let g:go_highlight_types=1
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_function_calls=1
let g:go_highlight_operators=1

" Use global, static locations for back,swap and undo
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set undodir=~/.vim/tmp/undo//

" ultisnips configuration
let g:UltiSnipsExpandTrigger="<c-e>"

" Toggle tagbar
nmap <F8> :TagbarToggle<CR>

" Use oo and OO for entering new lines without going into insert mode
nmap oo o<Esc>k
nmap OO O<Esc>j

" Remap leader to comma, all remaps using leader must be below this
let mapleader=","

" YouCompleteMe configuration
nnoremap <leader>gd :YcmCompleter GoTo<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>gi :YcmCompleter GoToImplementation<CR>
nnoremap <leader>gt :YcmCompleter GoToType<CR>
nnoremap <leader>rr :YcmCompleter RefactorRename

" Copy into the system clipboard
let s:clip = '/c/Windows/System32/clip.exe'
if executable(s:clip)
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * :call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
  augroup END
end
" Paste from the system clipboard
map <silent> <leader>p :r !powershell.exe -Command Get-Clipboard<CR>

" Leaders
" Save and close
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :wq<CR>
" Send Vim to background
nnoremap <leader>z <C-z>
" Show file in NERDTree
nnoremap <leader>r :NERDTreeFind<CR>
" Go to previous and next ALE errors
nnoremap <leader>j :ALENextWrap<CR>
nnoremap <leader>k :ALEPreviousWrap<CR>
" Format on key
nnoremap <leader>f :Autoformat<CR>
" Run jq on the current buffer
nnoremap <leader>jf :%! jq<CR>

" OmniSharp settings
let g:OmniSharp_server_path = '~/omnisharp.http-osx/omnisharp/OmniSharp.exe'

" Add all plugins to the runtimepath and then load all helptags, ignoring any
" errors as the command will continue to run
packloadall
silent! helptags ALL
