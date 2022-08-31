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
if !exists('g:vscode')
  Plug 'airblade/vim-gitgutter'                                                  " Git in gutter
  Plug 'christoomey/vim-tmux-navigator'                                          " Same split shortcuts in vim and tmux
  Plug 'junegunn/gv.vim'                                                         " Git commit browser
  Plug 'ludovicchabant/vim-gutentags'                                            " Tag management
  Plug 'majutsushi/tagbar'                                                       " A ctag viewer
  Plug 'preservim/nerdtree'                                                      " File explorer
  Plug 'tpope/vim-fugitive'                                                      " Git wrapper
  Plug 'vim-airline/vim-airline'                                                 " File status bar
  Plug 'vim-airline/vim-airline-themes'                                          " Themes for vim-airline
  Plug 'w0rp/ale'                                                                " Asynchronous Lint Engine aka ALE
endif

Plug 'Chiel92/vim-autoformat'                                                  " Generic code formatter
Plug 'editorconfig/editorconfig-vim'                                           " Make .editorconfig work
Plug 'godlygeek/tabular'                                                       " Tabularisation
Plug 'kevinoid/vim-jsonc'                                                      " JSON-C syntax
Plug 'junegunn/vim-easy-align'                                                 " Better/easier alignment
Plug 'ntpeters/vim-better-whitespace'                                          " Better whitespace
Plug 'towolf/vim-helm'                                                         " Helm template highlighting
Plug 'tpope/vim-commentary'                                                    " Comment out lines
Plug 'tpope/vim-obsession'                                                     " Improve session restoration
Plug 'tpope/vim-repeat'                                                        " Repeat plugin commands via '.'
Plug 'tpope/vim-surround'                                                      " Word/phrase surrounds
Plug 'Yggdroot/indentLine'                                                     " Better visual indentation

" specific languge plugins
Plug 'elixir-editors/vim-elixir'                                               " Elixir
Plug 'fatih/vim-go'                                                            " Golang
Plug 'hashivim/vim-terraform'                                                  " Terraform
Plug 'google/yapf'                                                             " Python
Plug 'leafgarland/typescript-vim'                                              " TypeScript
Plug 'leafOfTree/vim-svelte-plugin'                                            " Svelte
Plug 'Glench/Vim-Jinja2-Syntax'                                                " Jinja/Nunjucks
Plug 'pangloss/vim-javascript'                                                 " JavaScript
Plug 'posva/vim-vue'                                                           " Vue
Plug 'rust-lang/rust.vim'                                                      " Rust

" Neovim specific plugins
if has('nvim') && !exists('g:vscode')
  Plug 'phaazon/hop.nvim', { 'branch': 'v2' }                                  " Better motions - only supports neovim

  Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'                                  " Utils for TS LSP

  " cmp and sources
  Plug 'b0o/schemastore.nvim'                                                  " JSON Schema Store access
  Plug 'hrsh7th/nvim-cmp'                                                      " Autocompletion
  Plug 'hrsh7th/cmp-buffer'                                                    " Buffer source for nvim-cmp
  Plug 'hrsh7th/cmp-cmdline'                                                   " CMD line source for nvim-cmp
  Plug 'hrsh7th/cmp-emoji'                                                     " Emoji source for nvim-cmp
  Plug 'hrsh7th/cmp-nvim-lua'                                                  " nvim lua source for nvim-cmp
  Plug 'hrsh7th/cmp-nvim-lsp-signature-help'                                   " Signature help source for nvim-cmp
  Plug 'saadparwaiz1/cmp_luasnip'                                              " Snippets source for nvim-cmp
  Plug 'hrsh7th/cmp-nvim-lsp'                                                  " LSP source for nvim-cmp
  Plug 'hrsh7th/cmp-path'                                                      " Path source for nvim-cmp
  Plug 'onsails/lspkind.nvim'                                                  " Pictograms for nvim-cmp menu

  Plug 'jose-elias-alvarez/null-ls.nvim'                                       " LS diagnostics, code actions and more

  " snippets
  Plug 'L3MON4D3/LuaSnip'                                                      " Snippets plugin
  Plug 'rafamadriz/friendly-snippets'                                          " VSCode style snippets

  " Plug 'williamboman/nvim-lsp-installer'                                       " Installer for Language Servers used by Neovim's built-in LSP
  Plug 'neovim/nvim-lspconfig'                                                 " Common configs for Neovim's built-in LSP
  Plug 'nvim-lua/plenary.nvim'                                                 " Lua functions
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }                     " Fuzzy finder over lists
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}                  " Treesitter interface
endif
call plug#end()                                                                " all plugins must be added before this line

colorscheme monokai

" Special cases for filetypes
autocmd vimrc BufNewFile,BufRead .aliases,.env.* set filetype=sh
autocmd vimrc BufNewFile,BufRead *.md setlocal spell
autocmd vimrc BufNewFile,BufRead *.gitconfig set filetype=gitconfig
autocmd vimrc BufNewFile,BufRead *.nunjucks set filetype=html
autocmd vimrc BufNewFile,BufRead Dockerfile.* set filetype=dockerfile
autocmd vimrc BufNewFile,BufRead Jenkinsfile set syntax=groovy
autocmd vimrc BufWritePre * :silent! %s/\s\+$//e                               " Trim trailing whitespace on save, ignoring errors and messages
autocmd vimrc BufWritePre * :silent! %s#\($\n\s*\)\+\%$##                      " Trim trailing empty lines on save, ignoring errors and messages

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

" vim-airline settings
let g:airline_extension=['ale']
let g:airline_powerline_fonts=1
let g:airline_theme='base16_isotope'
let g:airline#extensions#ale#enabled=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail_improved'
let g:airline_section_b=''

" vim-go configuration
let g:go_fmt_command='goimports'
let g:go_highlight_fields=1
let g:go_highlight_function_calls=1
let g:go_highlight_functions=1
let g:go_highlight_operators=1
let g:go_highlight_types=1

" Copy into the system clipboard
let s:clip='/c/Windows/System32/clip.exe'
if executable(s:clip)
  autocmd vimrc TextYankPost * :call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' | '.s:clip)
endif
" Paste from the system clipboard
noremap <silent><leader>p :r !powershell.exe -Command Get-Clipboard<CR>

" Add all plugins to the runtimepath and then load all helptags, ignoring any
" errors as the command will continue to run
packloadall
silent! helptags ALL
