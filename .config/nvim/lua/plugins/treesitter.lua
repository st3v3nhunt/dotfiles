return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
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
          "python",
          "ruby",
          "rust",
          "toml",
          "typescript",
          "vim",
          "yaml",
        },

        sync_install = false,
        auto_install = true,
        ignore_install = {},

        highlight = {
          enable = true,
          disable = {},
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  },
}
