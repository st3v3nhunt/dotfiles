return {
  {
    'nvimtools/none-ls.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local null_ls = require("null-ls")

      local diagnostics = null_ls.builtins.diagnostics
      local formatting = null_ls.builtins.formatting

      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      local uses_prettier = function(utils)
        return utils.root_has_file({ ".prettierrc" })
      end

      null_ls.setup({
        debug = true,
        sources = {
          diagnostics.actionlint,
          diagnostics.credo,
          diagnostics.djlint,
          diagnostics.markdownlint,
          diagnostics.selene,
          diagnostics.rubocop,

          formatting.black,
          formatting.mix,
          formatting.markdownlint,
          formatting.prettierd.with({
            condition = uses_prettier,
            extra_filetypes = { "svelte" }
          }),
        },
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ bufnr = bufnr })
              end,
            })
          end
        end,
      })
    end,
  },
}
