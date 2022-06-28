local g = vim.g
local o = vim.opt

-- Get path to node which should be where global npms are installed
local fh = io.popen("which node")
local node_host_prog = fh:read("*a")
fh:close()
g.node_host_prog=node_host_prog

g.loaded_perl_provider=0
g.loaded_python_provider=0
g.loaded_ruby_provider=0
g.python3_host_prog='~/.pyenv/shims/python3'

-- Set options
o.autowrite=true                                                               -- Write file
o.clipboard = 'unnamed'
o.colorcolumn = '80'
o.completeopt='menu,menuone,preview,noselect,noinsert'                         -- Fixes issue with automatically completing autocomplete options (noinsert) and switches to popup rather than preview window
o.cmdheight=2                                                                  -- More space for messages
o.expandtab=true                                                               -- Insert spaces with tab
o.foldmethod='indent'                                                          -- Fold based on indentation
o.foldlevel=5                                                                  -- Default fold level. 5 should be ok to see most contents
o.ignorecase=true                                                              -- Ignore case when searching
o.list=true                                                                    -- Show listchars
o.listchars={ tab='▸\\' ,eol='¬' }                                             -- Override default listchars
o.number=true                                                                  -- Line numbers
o.path='.,/usr/include,,,**'                                                   -- Make :find search everything
o.previewheight=50                                                             -- Make preview window larger
o.relativenumber=true                                                          -- Show relative line numbers
o.shiftwidth=2                                                                 -- Number of spaces for each step of (auto)indent
o.showtabline=2                                                                -- Always show tab bar
o.shortmess='filnxtToOc'                                                       -- Ensure messages from ftplugins are shown
o.signcolumn='yes'                                                             -- Combine sign column - prevent interface moving around
o.smartcase=true                                                               -- Ignore case if search term is all lower, else be case sensitive
o.tabstop=2                                                                    -- Number of spaces for a tab
o.tags='tags'                                                                  -- Set tags to tags for ctags
o.timeoutlen=500                                                               -- Reduce amount of time to wait for second key
-- o.t_Co=256                                                                  -- 256 colours
o.undolevels=1000                                                              -- Undo more stuff
o.updatetime=300                                                               -- Decrease delays
