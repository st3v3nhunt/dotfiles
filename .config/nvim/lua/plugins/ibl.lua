return {
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require("ibl").setup({
        scope = { enabled = true }
      })
    end,
  },
}
