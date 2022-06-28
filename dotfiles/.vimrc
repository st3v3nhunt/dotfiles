" Use single grouping for all autocmds in file
augroup vimrc
  autocmd!
augroup END

" Install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd vimrc VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd vimrc VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
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
Plug 'editorconfig/editorconfig-vim'                                           " Make .editorconfig work
Plug 'godlygeek/tabular'                                                       " Tabularisation
Plug 'honza/vim-snippets'                                                      " Snippets
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }        " Markdown preview
Plug 'kevinoid/vim-jsonc'                                                      " JSON-C syntax
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }                            " Fuzzy file finder (executable)
Plug 'junegunn/fzf.vim'                                                        " Fuzzy file finder (for Vim)
Plug 'junegunn/vim-easy-align'                                                 " Better/easier alignment
Plug 'ludovicchabant/vim-gutentags'                                            " Tag management
Plug 'majutsushi/tagbar'                                                       " A ctag viewer
Plug 'mileszs/ack.vim'                                                         " File searching
Plug 'neoclide/coc.nvim', { 'branch': 'release' }                              " Conquer of Completion
Plug 'ntpeters/vim-better-whitespace'                                          " Better whitespace
Plug 'preservim/nerdtree'                                                      " File explorer
Plug 'rodrigore/coc-tailwind-intellisense', { 'do': 'npm install' }            " Tailwind CSS intellisense
Plug 'SirVer/ultisnips'                                                        " Snippet engine
Plug 'towolf/vim-helm'                                                         " Helm template highlighting
Plug 'tpope/vim-commentary'                                                    " Comment out lines
Plug 'tpope/vim-fugitive'                                                      " Git wrapper
Plug 'tpope/vim-obsession'                                                     " Improve session restoration
Plug 'tpope/vim-repeat'                                                        " Repeat plugin commands via '.'
Plug 'tpope/vim-surround'                                                      " Word/phrase surrounds
Plug 'vim-airline/vim-airline'                                                 " File status bar
Plug 'vim-airline/vim-airline-themes'                                          " Themes for vim-airline
Plug 'w0rp/ale'                                                                " Asynchronous Lint Engine aka ALE
" specific languge plugins
Plug 'fatih/vim-go'                                                            " Golang
Plug 'hashivim/vim-terraform'                                                  " Terraform
Plug 'google/yapf'                                                             " Python
Plug 'leafgarland/typescript-vim'                                              " TypeScript
Plug 'leafOfTree/vim-svelte-plugin'                                            " Svelte
Plug 'Glench/Vim-Jinja2-Syntax'                                                " Jinja/Nunjucks
Plug 'OmniSharp/omnisharp-vim'                                                 " C#
Plug 'pangloss/vim-javascript'                                                 " JavaScript
Plug 'posva/vim-vue'                                                           " Vue
Plug 'rust-lang/rust.vim'                                                      " Rust
" Neovim specific plugins
if has('nvim')
  Plug 'williamboman/nvim-lsp-installer'                                       " Installer for Language Servers used by Neovim's built-in LSP
  Plug 'neovim/nvim-lspconfig'                                                 " Common configs for Neovim's built-in LSP
endif
call plug#end()                                                                " all plugins must be added before this line

colorscheme monokai

" Special cases for filetypes
autocmd vimrc BufNewFile,BufRead .aliases set filetype=sh
autocmd vimrc BufNewFile,BufRead *.md setlocal spell
autocmd vimrc BufNewFile,BufRead *.gitconfig set filetype=gitconfig
autocmd vimrc BufNewFile,BufRead *.nunjucks set filetype=html
autocmd vimrc BufNewFile,BufRead Dockerfile.* set filetype=dockerfile
autocmd vimrc BufNewFile,BufRead Jenkinsfile set syntax=groovy

" Plugin specifc settings
let g:terraform_align=1
let g:terraform_fmt_on_save=1
let g:rustfmt_autosave=1

" NERDTree settings
let NERDTreeShowHidden=1
let g:NERDTreeMapOpenSplit='h'
let g:NERDTreeMapOpenVSplit='v'

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

" " Bind K to search for word under cursor
nnoremap K :Ack! "\b<C-R><C-W>\b"<CR>:cw<CR>

" vim-airline settings
let g:airline_extension=['ale']
let g:airline_powerline_fonts=1
let g:airline_theme='base16_isotope'
let g:airline#extensions#ale#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail_improved'
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

let g:UltiSnipsExpandTrigger="<C-e>"

" <coc-config>
" improve contrast for readability on dark backgrounds
hi CocErrorFloat ctermfg=196

" Use tab for trigger completion with characters ahead and navigate.
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
      \: "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"
nnoremap <leader>j <Plug>(coc-diagnostic-prev)
nnoremap <leader>k <Plug>(coc-diagnostic-next)
nnoremap <leader>gd <Plug>(coc-definition)
nnoremap <leader>gy <Plug>(coc-type-definition)
nnoremap <leader>gi <Plug>(coc-implementation)
nnoremap <leader>gr <Plug>(coc-references)
nnoremap <leader>ca <Plug>(coc-codeaction)
nnoremap <leader>fi <Plug>(coc-fix-current)
nnoremap <leader>rr <Plug>(coc-rename)
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
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
" installed extensions
let g:coc_global_extensions=[
      \  'coc-deno',
      \  'coc-go',
      \  'coc-json',
      \  'coc-markdownlint',
      \  'coc-marketplace',
      \  'coc-omnisharp',
      \  'coc-pyright',
      \  'coc-rust-analyzer',
      \  'coc-sh',
      \  'coc-svelte',
      \  'coc-tsserver',
      \  'coc-yaml',
      \]
nnoremap <leader>cr :CocRestart<CR>
" </coc-config>

" Copy into the system clipboard
let s:clip='/c/Windows/System32/clip.exe'
if executable(s:clip)
  autocmd vimrc TextYankPost * :call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
end
" Paste from the system clipboard
noremap <silent><leader>p :r !powershell.exe -Command Get-Clipboard<CR>

" Add all plugins to the runtimepath and then load all helptags, ignoring any
" errors as the command will continue to run
packloadall
silent! helptags ALL
