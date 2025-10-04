vim.opt_local.listchars = { tab = '┃ ', eol = '¬' }
vim.opt_local.shiftwidth = 4
vim.opt_local.tabstop = 4

-- Improve coloring for tab chars
vim.api.nvim_set_hl(0, 'SpecialKey', { ctermfg = 'darkgrey', ctermbg = 'black' })
