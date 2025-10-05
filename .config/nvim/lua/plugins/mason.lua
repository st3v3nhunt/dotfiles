return {
  -- Mason: Package manager for LSP servers, formatters, linters
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- Automatically install formatters and linters
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = "VeryLazy",
    opts = {
      ensure_installed = {
        -- Formatters
        "black", -- Python
        "prettierd", -- JS/TS/JSON/YAML/HTML/CSS/etc
        "stylua", -- Lua
        "shfmt", -- Shell
        "gofumpt", -- Go (alternative to gofmt)
        "goimports", -- Go imports
        "markdownlint-cli2", -- Markdown formatter/fixer

        -- Linters
        "selene", -- Lua
        "eslint_d", -- JS/TS (daemon version)
        "markdownlint", -- Markdown linter

        -- LSP servers (optional, can also be managed separately)
        "lua_ls",
        "ts_ls",
        "jsonls",
        "yamlls",
        "bashls",
        "dockerls",
      },
      auto_update = false,
      run_on_start = true,
    },
  },
}
