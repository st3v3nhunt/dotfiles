require('hop').setup()

local km = vim.keymap
km.set('n', 'f', "<cmd>lua require'hop'.hint_words()<cr>", {})
km.set('n', 'F', "<cmd>lua require'hop'.hint_words({ current_line_only = true })<cr>", {})
