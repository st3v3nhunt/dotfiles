local g = vim.g
local o = vim.opt

g.loaded_perl_provider = 0
g.loaded_python_provider = 0
g.loaded_ruby_provider = 0
g.markdown_folding = 1
g.markdown_fenced_languages = { "bash=sh", "javascript" }
g.markdown_syntax_conceal = 0
-- mise installs npm:neovim outside npm's global root, where Neovim looks
g.node_host_prog = vim.fn.expand("~/.local/share/mise/installs/npm-neovim/latest/node_modules/neovim/bin/cli.js")
-- venv with pynvim, created by scripts/install-mise.sh
g.python3_host_prog = vim.fn.stdpath("data") .. "/venv/bin/python"
g.vim_json_conceal = 0

-- Set options
o.autowrite = true
o.clipboard = "unnamed"
o.colorcolumn = "80"
-- Fixes issue with automatically completing autocomplete options (noinsert)
-- and switches to popup rather than preview window
o.completeopt = "menu,menuone,preview,noselect,noinsert"
-- More space for messages
o.cmdheight = 2
o.expandtab = true
o.foldmethod = "indent"
-- Default fold level. 5 works well on most content
o.foldlevel = 5
o.ignorecase = true
o.smartcase = true
o.list = true
o.listchars = { tab = "▸\\", eol = "¬" }
o.number = true
o.path = ".,/usr/include,,,**"
o.previewheight = 50
o.relativenumber = true
o.shiftwidth = 2
o.showtabline = 2
o.shortmess = "filnxtToOc"
o.signcolumn = "yes"
o.tabstop = 2
o.tags = "tags"
-- Amount of time to wait for second key
o.timeoutlen = 500
-- o.t_Co=256
o.undolevels = 1000
o.updatetime = 300
o.mouse = ""
