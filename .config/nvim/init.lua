-- Map leader early so it takes effect in all files
vim.g.mapleader = ","

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

-- VS Code specific configuration
if vim.g.vscode then
  require("vscode.settings")
else
  -- Load plugins with lazy.nvim
  require("lazy").setup("plugins", {
    change_detection = {
      notify = false,
    },
  })
end

-- Load user configuration
require("user")

-- Show split preview of all changes
vim.api.nvim_set_option_value("inccommand", "split", {})

-- Use internal formatting for bindings like gq
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.bo[args.buf].formatexpr = nil
  end,
})

-- Ensure nvim opens in git root
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local git_root = vim.fn.system("git rev-parse --show-toplevel 2>/dev/null"):gsub("\n", "")
    if vim.v.shell_error == 0 then
      vim.cmd("cd " .. git_root)
    end
  end,
})
