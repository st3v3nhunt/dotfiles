require('hop').setup()

local setKeyMap = vim.keymap.set
setKeyMap('n', 's', "<cmd>lua require'hop'.hint_words()<cr>", {})
setKeyMap('n', 'S', "<cmd>lua require'hop'.hint_words({ current_line_only = true })<cr>", {})
