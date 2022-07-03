local null_ls = require("null-ls")
local codeactions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local not_deno = function(utils)
  return not utils.root_has_file({ "deno.json", "deno.jsonc" })
end

null_ls.setup({
  debug = true,
  sources = {
    codeactions.eslint_d.with({ condition = not_deno }),
    codeactions.shellcheck,

    diagnostics.actionlint,
    diagnostics.djlint,
    diagnostics.markdownlint,
    diagnostics.shellcheck,
    diagnostics.selene,
    diagnostics.standardjs.with({ condition = not_deno }),

    -- formatting.djlint.with({ extra_args = { "--profile", "nunjucks" } }),
    formatting.markdownlint,
    formatting.standardjs.with({ condition = not_deno }),
    formatting.trim_newlines.with({ condition = not_deno }),
    formatting.trim_whitespace.with({ condition = not_deno }),
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
