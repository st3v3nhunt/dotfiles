print('loading lsp plugin')
local km = vim.keymap

km.set('n', '<leader>j', vim.diagnostic.goto_prev)
km.set('n', '<leader>k', vim.diagnostic.goto_next)
km.set('n', '<space>e', vim.diagnostic.open_float)
km.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  km.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  km.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  km.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  km.set('n', '<space>h', vim.lsp.buf.hover, bufopts)
  km.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  -- Clashes with move to split above and signature_help seems empty
  km.set('n', '<leader>s', vim.lsp.buf.signature_help, bufopts)
  -- km.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- km.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- km.set('n', '<space>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  km.set('n', '<space>rr', vim.lsp.buf.rename, bufopts)
  km.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  km.set('n', '<space>gr', vim.lsp.buf.references, bufopts)
  km.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)

  -- Turn off formatting for servers where there is a formatter setup with nullls
  if client.name == "tsserver" or client.name == "jsonls" then
    client.resolved_capabilities.document_formatting = false
  end
end

local g = vim.g
g.markdown_fenced_languages = {
  "ts=typescript"
}

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local nvim_lsp = require('lspconfig')
nvim_lsp.bashls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
nvim_lsp.denols.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
}
nvim_lsp.dockerls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
nvim_lsp.gopls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
nvim_lsp.jsonls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
}
nvim_lsp.rust_analyzer.setup {
  capabilities = capabilities,
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
nvim_lsp.sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
    },
  },
}
nvim_lsp.svelte.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
nvim_lsp.tailwindcss.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
nvim_lsp.taplo.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
local ts_utils = require('nvim-lsp-ts-utils')
nvim_lsp.tsserver.setup {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    ts_utils.setup({
      filter_out_diagnostics_by_code = { 80001 },
    })
    ts_utils.setup_client(client)
    on_attach(client, bufnr)
  end,
  root_dir = nvim_lsp.util.root_pattern("package.json"),
}
nvim_lsp.vuels.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
nvim_lsp.yamlls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}
