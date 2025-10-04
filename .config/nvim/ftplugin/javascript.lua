-- Search for prettier file recursively upwards
local prettier_config = vim.fn.findfile('.prettierrc', '.;')

if prettier_config ~= '' then
  vim.notify("Using prettier for linting and fixing", vim.log.levels.INFO)
  vim.b.ale_fixers = { 'prettier' }
  vim.b.ale_linters = { 'prettier' }
  vim.b.formatters_javascript = { 'prettier' }
else
  vim.notify("Using standard for linting and fixing", vim.log.levels.INFO)
  vim.b.ale_fixers = { 'standard' }
  vim.b.ale_linters = { 'standard' }
  vim.b.formatters_javascript = { 'standard_javascript' }
end
