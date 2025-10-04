local augroup = vim.api.nvim_create_augroup('UserConfig', { clear = true })

-- Enable spell checking for markdown files
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = augroup,
  pattern = '*.md',
  callback = function()
    vim.opt_local.spell = true
  end,
})

-- Set filetype for aliases and env files
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = augroup,
  pattern = { '.aliases', '.env.*' },
  callback = function()
    vim.bo.filetype = 'sh'
  end,
})

-- Set filetype for Dockerfiles
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = augroup,
  pattern = 'Dockerfile.*',
  callback = function()
    vim.bo.filetype = 'dockerfile'
  end,
})

-- Set filetype for Elixir templates
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = augroup,
  pattern = { '*.eex', '*.heex', '*.leex', '*.sface', '*.lexs' },
  callback = function()
    vim.bo.filetype = 'eelixir'
  end,
})

-- Set filetype for gitconfig files
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = augroup,
  pattern = '*.gitconfig',
  callback = function()
    vim.bo.filetype = 'gitconfig'
  end,
})

-- Set filetype for nunjucks templates
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = augroup,
  pattern = '*.nunjucks',
  callback = function()
    vim.bo.filetype = 'html'
  end,
})

-- Set syntax for Jenkinsfile
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = augroup,
  pattern = 'Jenkinsfile',
  callback = function()
    vim.bo.syntax = 'groovy'
  end,
})

-- Trim trailing whitespace on save
vim.api.nvim_create_autocmd('BufWritePre', {
  group = augroup,
  pattern = '*',
  callback = function()
    -- Save cursor position
    local save = vim.fn.winsaveview()
    -- Remove trailing whitespace
    vim.cmd([[silent! %s/\s\+$//e]])
    -- Remove trailing empty lines
    vim.cmd([[silent! %s#\($\n\s*\)\+\%$##]])
    -- Restore cursor position
    vim.fn.winrestview(save)
  end,
})

-- WSL clipboard integration
local clip = '/c/Windows/System32/clip.exe'
if vim.fn.executable(clip) == 1 then
  vim.api.nvim_create_autocmd('TextYankPost', {
    group = augroup,
    pattern = '*',
    callback = function()
      local contents = table.concat(vim.v.event.regcontents, '\n')
      vim.fn.system('echo ' .. vim.fn.shellescape(contents) .. ' | ' .. clip)
    end,
  })
end
