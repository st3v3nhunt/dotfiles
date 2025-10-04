-- VSCode Neovim integration settings
-- TODO: This is a more contemporary version

local function split(direction, file)
  local cmd = direction == 'h' and 'workbench.action.splitEditorDown' or 'workbench.action.splitEditorRight'
  vim.fn.VSCodeCall(cmd)
  if file ~= '' then
    vim.fn.VSCodeExtensionNotify('open-file', vim.fn.expand(file), 'all')
  end
end

local function splitNew(direction, file)
  split(direction, file == '' and '__vscode_new__' or file)
end

local function closeOtherEditors()
  vim.fn.VSCodeNotify('workbench.action.closeEditorsInOtherGroups')
  vim.fn.VSCodeNotify('workbench.action.closeOtherEditors')
end

local function manageEditorSize(count, to)
  local action = to == 'increase' and 'workbench.action.increaseViewSize' or 'workbench.action.decreaseViewSize'
  for _ = 1, (count or 1) do
    vim.fn.VSCodeNotify(action)
  end
end

-- Commands
vim.api.nvim_create_user_command('Split', function(opts)
  split('h', opts.args)
end, { nargs = '?', complete = 'file' })

vim.api.nvim_create_user_command('Vsplit', function(opts)
  split('v', opts.args)
end, { nargs = '?', complete = 'file' })

vim.api.nvim_create_user_command('New', function()
  split('h', '__vscode_new__')
end, { nargs = '?', complete = 'file' })

vim.api.nvim_create_user_command('Vnew', function()
  split('v', '__vscode_new__')
end, { nargs = '?', complete = 'file' })

vim.api.nvim_create_user_command('Only', function(opts)
  if opts.bang then
    closeOtherEditors()
  else
    vim.fn.VSCodeNotify('workbench.action.joinAllGroups')
  end
end, { bang = true })

-- Keymaps
local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Window splitting
map({'n', 'x'}, '<C-w>s', function() split('h', '') end)
map({'n', 'x'}, '<C-w>v', function() split('v', '') end)
map({'n', 'x'}, '<C-w>n', function() splitNew('h', '__vscode_new__') end)
map({'n', 'x'}, '<C-w>=', function() vim.fn.VSCodeNotify('workbench.action.evenEditorWidths') end)

-- Window sizing
map({'n', 'x'}, '<C-w>>', function() manageEditorSize(vim.v.count, 'increase') end)
map({'n', 'x'}, '<C-w>+', function() manageEditorSize(vim.v.count, 'increase') end)
map({'n', 'x'}, '<C-w><', function() manageEditorSize(vim.v.count, 'decrease') end)
map({'n', 'x'}, '<C-w>-', function() manageEditorSize(vim.v.count, 'decrease') end)

-- Navigation
map({'n', 'x'}, '<C-j>', function() vim.fn.VSCodeNotify('workbench.action.navigateDown') end)
map({'n', 'x'}, '<C-k>', function() vim.fn.VSCodeNotify('workbench.action.navigateUp') end)
map({'n', 'x'}, '<C-h>', function() vim.fn.VSCodeNotify('workbench.action.navigateLeft') end)
map({'n', 'x'}, '<C-l>', function() vim.fn.VSCodeNotify('workbench.action.navigateRight') end)

-- Commentary (C-/)
map({'n', 'x'}, '<C-/>', function() vim.fn.VSCodeCall('editor.action.commentLine') end)

-- Toggle editor width
map('n', '<C-w>_', function() vim.fn.VSCodeNotify('workbench.action.toggleEditorWidths') end)

-- Which key
map({'n', 'x'}, '<Space>', function() vim.fn.VSCodeNotify('whichkey.show') end)
