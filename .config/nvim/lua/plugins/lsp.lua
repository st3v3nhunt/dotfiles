print('loading lsp plugin')
-- require("nvim-lsp-installer").setup {}
local km = vim.keymap

km.set('n', '<leader>j', vim.diagnostic.goto_prev)
km.set('n', '<leader>k', vim.diagnostic.goto_next)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  km.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  km.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  km.set('n', '<leader>h', vim.lsp.buf.hover, bufopts)
  km.set('n', '<leader>gi', vim.lsp.buf.implementation, bufopts)
  km.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  km.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  km.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  km.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  km.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  km.set('n', '<leader>rr', vim.lsp.buf.rename, bufopts)
  km.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  km.set('n', '<leader>gr', vim.lsp.buf.references, bufopts)
  km.set('n', '<leader>ff', vim.lsp.buf.formatting, bufopts)
end

local g = vim.g
g.markdown_fenced_languages = {
  "ts=typescript"
}

local nvim_lsp = require'lspconfig'
nvim_lsp.bashls.setup{
  on_attach = on_attach,
}
nvim_lsp.denols.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
}
nvim_lsp.dockerls.setup{
  on_attach = on_attach,
}
nvim_lsp.jsonls.setup{
  on_attach = on_attach,
}
-- Issue with not having a local copy of remark and not able to default to
-- global install - https://github.com/remarkjs/remark-language-server/issues/6
-- nvim_lsp.remark_ls.setup{}
nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
        importPrefix = "self",
      },
      cargo = {
        loadOutDirsFromCheck = true
      },
      procMacro = {
        enable = true
      },
    }
  }
}
nvim_lsp.sumneko_lua.setup{
  on_attach = on_attach,
}
nvim_lsp.svelte.setup{
  on_attach = on_attach,
}
nvim_lsp.tailwindcss.setup{
  on_attach = on_attach,
}
nvim_lsp.taplo.setup{
  on_attach = on_attach,
}
nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("package.json"),
}
nvim_lsp.yamlls.setup{
  on_attach = on_attach,
}
