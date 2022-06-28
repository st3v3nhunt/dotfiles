local km = vim.keymap

km.set('x', 'ga', '<Plug>(EasyAlign)')
km.set('n', 'ga', '<Plug>(EasyAlign)')

km.set('n', '<C-n>', ':NERDTreeToggle<CR>')
-- km.set('n', 'K', ':Ack! \'\b<C-R><C-W>\b\'<CR>:cw<CR>')                          -- Bind K to search for word under cursor
km.set('n', '\\', ':Ack!<space>')
km.set('n', '<F8>', ':TagbarToggle<CR>')

-- Use oo and OO for entering new lines without going into insert mode
km.set('n', 'oo', 'o<Esc>k')
km.set('n', 'OO', 'O<Esc>j')

-- Use jk to exist insert more
km.set('i', 'jk', '<ESC>')

-- Turn arrow keys off
km.set('n', '<up>', '<NOP>')
km.set('n', '<down>', '<NOP>')
km.set('n', '<left>', '<NOP>')
km.set('n', '<right>', '<NOP>')

-- Tab mappings
km.set('n', 'th', ':tabfirst<CR>')
km.set('n', 'tj', ':tabprev<CR>')
km.set('n', 'tk', ':tabnext<CR>')
km.set('n', 'tl', ':tablast<CR>')
km.set('n', 'ts', ':tab split<CR>')
km.set('n', 'to', ':tabnew<CR>')
km.set('n', 'tm', ':tabm<Space>')
km.set('n', 'tc', ':tabclose<CR>')
km.set('n', 'tt', '<C-W>T')

-- Fugitive mappings
km.set('n', '<leader>gb', ':Gblame<CR>')
km.set('n', '<leader>gvd', ':Gvdiffsplit!<CR>')
km.set('n', '<leader>ghd', ':Ghdiffsplit!<CR>')
km.set('n', '<leader>gvdm', ':Gvdiffsplit! main<CR>')
km.set('n', '<leader>ghdm', ':Ghdiffsplit! main<CR>')

-- Misc, helpers
km.set('n', '<leader>w', ':w<CR>')
km.set('n', '<leader>q', ':q<CR>')
km.set('n', '<leader>z', '<C-z>')
km.set('n', '<leader>re', ':NERDTreeFind<CR>')
km.set('n', '<leader>ff', ':Autoformat<CR>')
km.set('n', '<leader>fj', ':%! jq<CR>')

-- vimrc file mappings
km.set('n', '<leader>ev', ':vsplit $MYVIMRC<CR>')
km.set('n', '<leader>sv', ':source $MYVIMRC<CR>')
