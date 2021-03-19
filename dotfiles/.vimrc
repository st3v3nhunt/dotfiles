set nocompatible                                                               " use vim settings
set path+=**                                                                   " make :find search everything
set tags=tags                                                                  " set tags to tags for ctags
set autowrite                                                                  " write file
set timeoutlen=500                                                             " reduce amount of time to wait for second key
set showtabline=2                                                              " always show tab bar
set signcolumn=yes                                                             " combine sign column - prevent interface moving around
set previewheight=50                                                           " make preview window larger

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin()
" theme(s)
Plug 'crusoexia/vim-monokai'
" generally useful plugins
Plug 'airblade/vim-gitgutter'                                                  " Git in gutter
Plug 'Chiel92/vim-autoformat'                                                  " Generic code formatter
Plug 'christoomey/vim-tmux-navigator'                                          " Same split shortcuts in vim and tmux
Plug 'ctrlpvim/ctrlp.vim'                                                      " Fuzzy file finder
Plug 'godlygeek/tabular'                                                       " Tabularisation
Plug 'honza/vim-snippets'                                                      " Snippets
Plug 'junegunn/vim-easy-align'                                                 " Better/easier alignment
Plug 'ludovicchabant/vim-gutentags'                                            " Tag management
Plug 'majutsushi/tagbar'                                                       " A ctag viewer
Plug 'mileszs/ack.vim'                                                         " File searching
Plug 'neoclide/coc.nvim'                                                       " Conquer of Completion
Plug 'ntpeters/vim-better-whitespace'                                          " Better whitespace
Plug 'scrooloose/nerdtree'                                                     " File explorer
Plug 'SirVer/ultisnips'                                                        " Snippet engine
Plug 'tpope/vim-commentary'                                                    " Comment out lines
Plug 'tpope/vim-fugitive'                                                      " Git wrapper
Plug 'tpope/vim-obsession'                                                     " Improve session restoration
Plug 'tpope/vim-repeat'                                                        " Repeat plugin commands via '.'
Plug 'tpope/vim-surround'                                                      " Word/phrase surrounds
Plug 'vim-airline/vim-airline'                                                 " File status bar
Plug 'vim-airline/vim-airline-themes'                                          " Themes for vim-airline
Plug 'w0rp/ale'                                                                " Asynchronous Lint Engine aka ALE
" specific languge plugins
Plug 'evanleck/vim-svelte'                                                     " Svelte
Plug 'fatih/vim-go'                                                            " Golang
Plug 'hashivim/vim-terraform'                                                  " Terraform
Plug 'google/yapf'                                                             " Python
Plug 'leafgarland/typescript-vim'                                              " TypeScript
Plug 'lepture/vim-jinja'                                                       " Jinja/Nunjucks
Plug 'OmniSharp/omnisharp-vim'                                                 " C#
Plug 'pangloss/vim-javascript'                                                 " JavaScript
Plug 'posva/vim-vue'                                                           " Vue
Plug 'rust-lang/rust.vim'                                                      " Rust
call plug#end()                                                                " all plugins must be added before this line

colorscheme monokai

set autoindent                                                                 " auto indent
set clipboard=unnamed                                                          " allow copy between instances
set colorcolumn=80                                                             " 80 column guide
set expandtab                                                                  " insert spaces with tab
set foldmethod=indent                                                          " fold based on indentation
set foldlevel=5                                                                " default fold level. 5 should be ok to see most contents
set history=500                                                                " remember more stuff
set hlsearch                                                                   " highlight searches
set ignorecase                                                                 " ignore case when searching
set incsearch                                                                  " incremental search
set list                                                                       " show listchars
set listchars=tab:▸\ ,eol:¬                                                    " override default listchars
set number                                                                     " line numbers
set completeopt=menu,menuone,preview,noselect,noinsert                         " fixes issue with automatically completing autocomplete options (noinsert) and switches to popup rather than preview window
set relativenumber                                                             " show relative line numbers
set shiftwidth=2                                                               " number of spaces for each step of (auto)indent
set showcmd                                                                    " show command on screen
set smartcase                                                                  " ignore case if search term is all lower, else be case sensitive
set t_Co=256                                                                   " 256 colours
set tabstop=2                                                                  " number of spaces for a tab
set undolevels=1000                                                            " undo more stuff

" Use single grouping for all autocmds in file
augroup vimrc
  autocmd!
augroup END

" special cases for filetypes
autocmd vimrc BufNewFile,BufRead *.md setlocal spell
autocmd vimrc BufNewFile,BufRead *.nunjucks set filetype=html
autocmd vimrc BufNewFile,BufRead Dockerfile.* set filetype=dockerfile
autocmd vimrc BufNewFile,BufRead Jenkinsfile set syntax=groovy

" Plugin specifc settings
let g:terraform_align=1
let g:terraform_fmt_on_save=1
let g:rustfmt_autosave=1

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

" Ack - use ripgrep if available
if executable('rg')
  let g:ackprg='rg --vimgrep'
endif

" Bind K to search for word under cursor
nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>
" Map Ack! to \
nnoremap \ :Ack!<space>

" vim-airline settings
let g:airline_extension=['ale']
let g:airline_powerline_fonts=1
let g:airline_theme='base16_isotope'
let g:airline#extensions#ale#enabled=1
let g:airline_section_b=''

" ALE configuration
let g:ale_typescript_standard_executable='ts-standard'
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

" use global, static locations for back,swap and undo
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set undodir=~/.vim/tmp/undo//

let g:UltiSnipsExpandTrigger="<c-e>"
nmap <F8> :TagbarToggle<CR>

" Use oo and OO for entering new lines without going into insert mode
nmap oo o<Esc>k
nmap OO O<Esc>j

" Remap leader to comma, all remaps using leader must be below this
let mapleader=","

" <coc-config>
" improve contrast for readability on dark backgrounds
hi CocErrorFloat ctermfg=196

set hidden
set cmdheight=2                                                                " more space for messages
set updatetime=300                                                             " decrease delays
set shortmess+=c                                                               " don't pass messages to |ins-completion-menu|
" use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nmap <leader>j <Plug>(coc-diagnostic-prev)
nmap <leader>k <Plug>(coc-diagnostic-next)
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>ca <Plug>(coc-codeaction)
nmap <leader>fi <Plug>(coc-fix-current)
nmap <leader>rr <Plug>(coc-rename)
nnoremap <leader>h :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction
" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
" installed extensions
let g:coc_global_extensions=[
\  'coc-go',
\  'coc-json',
\  'coc-marketplace',
\  'coc-markdownlint',
\  'coc-omnisharp',
\  'coc-rust-analyzer',
\  'coc-sh',
\  'coc-svelte',
\  'coc-tsserver',
\  'coc-yaml',
\]
" </coc-config>

" Copy into the system clipboard
let s:clip='/c/Windows/System32/clip.exe'
if executable(s:clip)
  autocmd vimrc TextYankPost * :call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
end
" Paste from the system clipboard
map <silent><leader>p :r !powershell.exe -Command Get-Clipboard<CR>

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>z <C-z>
nnoremap <leader>re :NERDTreeFind<CR>
nnoremap <leader>f :Autoformat<CR>
nnoremap <leader>jf :%! jq<CR>

" Tab options
nnoremap th :tabfirst<CR>
nnoremap tj :tabprev<CR>
nnoremap tk :tabnext<CR>
nnoremap tl :tablast<CR>
nnoremap ts :tab split<CR>
nnoremap to :tabnew<CR>
nnoremap tm :tabm<Space>
nnoremap tc :tabclose<CR>

" Remap arrow keys to not work, in any mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Add all plugins to the runtimepath and then load all helptags, ignoring any
" errors as the command will continue to run
packloadall
silent! helptags ALL
