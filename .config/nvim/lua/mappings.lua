local setKeyMap = vim.keymap.set

setKeyMap('x', 'ga', '<Plug>(EasyAlign)')
setKeyMap('n', 'ga', '<Plug>(EasyAlign)')

-- NERDTree mappings
setKeyMap('n', '<leader>re', ':NERDTreeFind<CR>')
setKeyMap('n', '<C-n>', ':NERDTreeToggle<CR>')

-- km('n', 'K', ':Ack! \'\b<C-R><C-W>\b\'<CR>:cw<CR>')                          -- Bind K to search for word under cursor
setKeyMap('n', '\\', ':Ack!<space>')
setKeyMap('n', '<F8>', ':TagbarToggle<CR>')

-- Use oo and OO for entering new lines without going into insert mode
setKeyMap('n', 'oo', 'o<Esc>k')
setKeyMap('n', 'OO', 'O<Esc>j')

-- Use jk to exist insert more
setKeyMap('i', 'jk', '<ESC>')

-- Turn arrow keys off
setKeyMap('n', '<up>', '<NOP>')
setKeyMap('n', '<down>', '<NOP>')
setKeyMap('n', '<left>', '<NOP>')
setKeyMap('n', '<right>', '<NOP>')

-- Tab mappings
setKeyMap('n', 'th', ':tabfirst<CR>')
setKeyMap('n', 'tj', ':tabprev<CR>')
setKeyMap('n', 'tk', ':tabnext<CR>')
setKeyMap('n', 'tl', ':tablast<CR>')
setKeyMap('n', 'ts', ':tab split<CR>')
setKeyMap('n', 'to', ':tabnew<CR>')
setKeyMap('n', 'tm', ':tabm<Space>')
setKeyMap('n', 'tc', ':tabclose<CR>')
setKeyMap('n', 'tt', '<C-W>T')

-- Fugitive mappings
setKeyMap('n', '<leader>gb', ':Gblame<CR>')
setKeyMap('n', '<leader>gvd', ':Gvdiffsplit!<CR>')
setKeyMap('n', '<leader>ghd', ':Ghdiffsplit!<CR>')
setKeyMap('n', '<leader>gvdm', ':Gvdiffsplit! main<CR>')
setKeyMap('n', '<leader>ghdm', ':Ghdiffsplit! main<CR>')

-- Interface mappings
setKeyMap('n', '<leader>w', ':w<CR>')
setKeyMap('n', '<leader>q', ':q<CR>')
setKeyMap('n', '<leader>z', '<C-z>')

-- Formatting mappings
setKeyMap('n', '<leader>ff', ':Autoformat<CR>')
setKeyMap('n', '<leader>fj', ':%! jq<CR>')

-- vimrc file mappings
setKeyMap('n', '<leader>ev', ':vsplit $MYVIMRC<CR>')
setKeyMap('n', '<leader>sv', ':source $MYVIMRC<CR>')
