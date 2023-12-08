local setKeyMap = vim.keymap.set

-- Lua
setKeyMap('n', '<leader>t', ':TroubleToggle<cr>')
-- setKeyMap("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
-- setKeyMap("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
-- setKeyMap("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
-- setKeyMap("n", "<leader>xl", function() require("trouble").toggle("loclist") end)
-- setKeyMap("n", "gR", function() require("trouble").toggle("lsp_references") end)
