require('hop').setup()

local setKeyMap = vim.keymap.set
setKeyMap('n', 'f', "<cmd>lua require'hop'.hint_words()<cr>", {})
setKeyMap('n', 'F', "<cmd>lua require'hop'.hint_words({ current_line_only = true })<cr>", {})
