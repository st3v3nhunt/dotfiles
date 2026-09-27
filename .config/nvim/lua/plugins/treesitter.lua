return {
  {
    -- The `main` branch is required for Neovim 0.12+ and does not support
    -- lazy-loading. Building parsers requires the `tree-sitter` CLI.
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
        "bash",
        "c_sharp",
        "css",
        "dockerfile",
        "eex",
        "elixir",
        "heex",
        "html",
        "javascript",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "ruby",
        "rust",
        "toml",
        "typescript",
        "vim",
        "yaml",
      })

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("user_treesitter", { clear = true }),
        callback = function(args)
          -- Silently skip filetypes without an installed parser
          pcall(vim.treesitter.start, args.buf)
        end,
      })
    end,
  },
}
