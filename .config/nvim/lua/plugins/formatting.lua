return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = "",
        desc = "Format buffer",
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first = true },
        json = { "prettierd", "prettier", stop_after_first = true },
        yaml = { "prettierd", "prettier", stop_after_first = true },
        markdown = { "markdownlint-cli2", "prettier", "injected" },
        html = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd", "prettier", stop_after_first = true },
        scss = { "prettierd", "prettier", stop_after_first = true },
        svelte = { "prettierd", "prettier", stop_after_first = true },
        vue = { "prettierd", "prettier", stop_after_first = true },
        elixir = { "mix" },
        rust = { "rustfmt" },
        go = { "goimports", "gofmt" },
        sh = { "shfmt" },
      },
      format_on_save = function(bufnr)
        -- Disable autoformat for files in certain directories
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname:match("/node_modules/") then
          return
        end

        -- Use longer timeout for markdown files
        local ft = vim.bo[bufnr].filetype
        local timeout = ft == "markdown" and 3000 or 1000

        return {
          timeout_ms = timeout,
          lsp_fallback = true,
        }
      end,
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2" },
        },
        prettier = {
          prepend_args = { "--prose-wrap", "always", "--print-width", "120" },
        },
        stylua = {
          prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        },
      },
    },
  },
}
