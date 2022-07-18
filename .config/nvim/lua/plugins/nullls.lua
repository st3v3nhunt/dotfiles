local null_ls = require("null-ls")
local codeactions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local property_exists_in_package_json = function(utils, property)
  local file_exists = utils.root_has_file({ "package.json" })
  if not file_exists then
    return false
  end
  local handle = io.popen("jq -j '." .. property .. " | length' package.json")
  if handle == nil then
    return false
  end
  local output = handle:read("*a")
  handle:close()
  return tonumber(output, 10) > 0
end

local uses_eslint = function(utils)
  return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.yaml", ".eslintrc.yml", ".eslintrc.json" })
  or property_exists_in_package_json(utils, "eslintConfig")
end

local uses_standardjs = function(utils)
  return property_exists_in_package_json(utils, "standard")
end

local uses_prettier = function(utils)
  return utils.root_has_file({ ".prettierrc" })
end

null_ls.setup({
  debug = true,
  sources = {
    codeactions.eslint_d.with({ condition = uses_eslint }),
    codeactions.shellcheck,

    diagnostics.actionlint,
    diagnostics.djlint,
    diagnostics.markdownlint,
    diagnostics.shellcheck,
    diagnostics.selene,
    diagnostics.standardjs.with({ condition = uses_standardjs }),

    -- formatting.djlint.with({ extra_args = { "--profile", "nunjucks" } }),
    formatting.markdownlint,
    formatting.prettierd.with({ condition = uses_prettier }),
    formatting.standardjs.with({ condition = uses_standardjs }),
  },
  on_attach = function(client, bufnr)
    -- Run formatting on save
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          vim.lsp.buf.formatting_sync()
        end,
      })
    end
  end,
})
