set nocompatible            " use vim settings
filetype off                " required
set path+=**                " make :find search everything
set tags=tags               " set tags to tags for ctags
set autowrite               " write file
set timeoutlen=500          " reduce amount of time to wait for second key

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'             " Vundle should manage Vundle
" Themes
Plugin 'crusoexia/vim-monokai'
" generally useful plugins
Plugin 'airblade/vim-gitgutter'           " Git into in gutter
Plugin 'Chiel92/vim-autoformat'           " Generic code formatter
Plugin 'christoomey/vim-tmux-navigator'   " Same split shortcuts in vim and tmux
Plugin 'ctrlpvim/ctrlp.vim'               " Fuzzy file finder
Plugin 'godlygeek/tabular'                " Tabularisation
Plugin 'honza/vim-snippets'               " Snippets
Plugin 'junegunn/vim-easy-align'          " Better/easier alignment
Plugin 'ludovicchabant/vim-gutentags'     " Tag management
Plugin 'majutsushi/tagbar'                " A ctag viewer
Plugin 'mileszs/ack.vim'                  " File searching
Plugin 'ntpeters/vim-better-whitespace'   " Better whitespace
Plugin 'scrooloose/nerdtree'              " File explorer
Plugin 'SirVer/ultisnips'                 " Snippet engine
Plugin 'tpope/vim-commentary'             " Comment out lines
Plugin 'tpope/vim-fugitive'               " Git wrapper
Plugin 'tpope/vim-obsession'              " Improve session restoration
Plugin 'tpope/vim-repeat'                 " Repeat plugin commands via .
Plugin 'tpope/vim-surround'               " Word/phrase surrounds
Plugin 'Valloric/YouCompleteMe'           " Code completion engine
Plugin 'vim-airline/vim-airline'          " File status bar
Plugin 'vim-airline/vim-airline-themes'   " Themes for vim-airline
Plugin 'w0rp/ale'                         " Asynchronous Lint Engine aka ALE
" specific languge plugins
Plugin 'fatih/vim-go'                     " Golang
Plugin 'hashivim/vim-terraform'           " Terraform
Plugin 'google/yapf'                      " Python
Plugin 'leafgarland/typescript-vim'       " TypeScript
Plugin 'lepture/vim-jinja'                " Jinja/Nunjucks
Plugin 'OmniSharp/omnisharp-vim'          " C#
Plugin 'pangloss/vim-javascript'          " JavaScript
Plugin 'posva/vim-vue'                    " Vue
Plugin 'rust-lang/rust.vim'               " Rust

" All plugins must be added before this line
call vundle#end()             " required

colorscheme monokai
filetype plugin indent on     " required
syntax on                     " syntax highlighting

set autoindent                                                    " auto indent
set clipboard=unnamed                                             " allow copy between instances
set colorcolumn=80                                                " 80 column guide
set expandtab                                                     " insert spaces with tab
set foldmethod=indent                                             " fold based on indentation
set foldlevel=5                                                   " default fold level. 5 should be ok to see most contents
set history=500                                                   " remember more stuff
set hlsearch                                                      " highlight searches
set ignorecase                                                    " ignore case when searching
set incsearch                                                     " incremental search
set list                                                          " show listchars
set listchars=tab:▸\ ,eol:¬                                       " override default listchars
set number                                                        " line numbers
set completeopt=menu,menuone,preview,noselect,noinsert            " fixes issue with automatically completing autocomplete options (noinsert) and switches to popup rather than preview window
set relativenumber                                                " show relative line numbers
set shiftwidth=2                                                  " number of spaces for each step of (auto)indent
set showcmd                                                       " show command on screen
set smartcase                                                     " ignore case if search term is all lower, else be case sensitive
set t_Co=256                                                      " 256 colours
set tabstop=2                                                     " number of spaces for a tab
set undolevels=1000                                               " undo more stuff

autocmd BufRead,BufNewFile *.md setlocal spell                    " turn spell check on for *.md files
autocmd BufRead,BufNewFile *.nunjucks set filetype=html           " identify nunjucks files as html
autocmd BufRead,BufNewFile Dockerfile.* set filetype=dockerfile   " identify Dockerfiles.<purpose> as dockerfile
autocmd BufRead,BufNewFile Jenkinsfile set syntax=groovy          " identify Jenkinsfile as groovy

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

" CtrlP - Ignore VCS and node stuff
let g:ctrlp_custom_ignore='\v[\/](coverage|node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_extensions=['tag']
let g:ctrlp_show_hidden=1
let g:ctrlp_use_caching=1

" Ack - use the_silver_searcher if avaiable
if executable('ag')
  " Use ag in place of ack
  let g:ackprg='ag --vimgrep'
endif

" Bind K to search for word under cursor
nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>
" Map Ack! to \
nnoremap \ :Ack!<space>

" vim-airline settings
" only load these extensions to speed up loading
let g:airline_extension=['ale']
let g:airline_powerline_fonts=1
let g:airline_theme='base16_isotope'
let g:airline#extensions#ale#enabled=1       " error information in the status bar
let g:airline_section_b=''

" ALE configuration
let g:ale_completion_tsserver_autoimport=1
let g:ale_fix_on_save=1
let g:ale_fixers={
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\}
let g:ale_hover_cursor=0
let g:ale_lint_on_save=1
let g:ale_sign_error='✗✗'
let g:ale_sign_warning='∆∆'

" vim-go configuration
let g:go_fmt_command='goimports'
let g:go_highlight_fields=1
let g:go_highlight_function_calls=1
let g:go_highlight_functions=1
let g:go_highlight_operators=1
let g:go_highlight_types=1

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

" Prevent popup being displayed on CursorHold
let g:ycm_auto_hover=''
" Prevent the QuickFix window from closing
autocmd User YcmQuickFixOpened autocmd! ycmquickfix WinLeave
" YouCompleteMe configuration
" Toggle YCM hover
nmap <leader>h <plug>(YCMHover)
nnoremap <leader>fi :YcmCompleter FixIt<CR>
nnoremap <leader>gg :YcmCompleter GoTo<CR>
nnoremap <leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <leader>gi :YcmCompleter GoToImplementation<CR>
nnoremap <leader>gt :YcmCompleter GoToType<CR>
nnoremap <leader>rr :YcmCompleter RefactorRename<space>
nnoremap <leader>yy :YcmRestartServer<CR>

" Copy into the system clipboard
let s:clip='/c/Windows/System32/clip.exe'
if executable(s:clip)
  augroup WSLYank
    autocmd!
    autocmd TextYankPost * :call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
  augroup END
end
" Paste from the system clipboard
map <silent> <leader>p :r !powershell.exe -Command Get-Clipboard<CR>

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

" Add all plugins to the runtimepath and then load all helptags, ignoring any
" errors as the command will continue to run
packloadall
silent! helptags ALL
