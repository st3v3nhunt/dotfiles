print('loading lsp plugin')

-- Turn on for debug ouput
-- vim.lsp.set_log_level("debug")
local km = vim.keymap

km.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  km.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  km.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  km.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  km.set('n', '<space>h', vim.lsp.buf.hover, bufopts)
  km.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  km.set('n', '<leader>s', vim.lsp.buf.signature_help, bufopts)
  -- km.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  -- km.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  -- km.set('n', '<space>wl', function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, bufopts)
  km.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  km.set('n', '<leader>.', vim.lsp.buf.code_action, bufopts)
  km.set('n', '<space>gr', vim.lsp.buf.references, bufopts)
  km.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)

  -- Turn off formatting for servers where there is a formatter setup with nullls
  if client.name == "ts_ls" or client.name == "jsonls" or client.name == "svelte" then
    client.server_capabilities.document_formatting = false
  end
end

local g = vim.g
g.markdown_fenced_languages = {
  "ts=typescript"
}

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- apply config to all lsp
vim.lsp.config('*', {
  capabilities = capabilities,
  on_attach = on_attach,
})
-- enable the language servers
vim.lsp.enable({'bashls', 'dockerls', 'eslint', 'gopls', 'rubocop', 'svelte', 'vuels', 'yamlls'})

vim.lsp.config('denols', {
  single_file_support = false,
})
vim.lsp.config('ruby_lsp', {
  root_markers = { "Gemfile" },
})
vim.lsp.config('elixirls', {
  cmd = { vim.env.HOMEBREW_PREFIX .. "/bin/elixir-ls" },
})
-- lexical didn't seem to be working...
-- vim.lsp.config().lexical.setup {
--   cmd = { vim.env.HOME .. "/code/lexical/_build/dev/package/lexical/bin/start_lexical.sh" },
-- }
vim.lsp.config('jsonls', {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
})
vim.lsp.config('omnisharp', {
  cmd = { vim.env.HOME .. "/.cache/omnisharp-vim/omnisharp-roslyn/OmniSharp" },
  enable_roslyn_analyzers = true,
  organize_imports_on_format = true,
})
vim.lsp.config('rust_analyzer', {
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
})
vim.lsp.config('lua_ls', {
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
})
vim.lsp.config('tailwindcss', {
  init_options = {
    userLanguages = {
      elixir = "html-eex",
      eelixir = "html-eex",
      heex = "html-eex",
    },
  },
})
local ts_utils = require('nvim-lsp-ts-utils')
vim.lsp.config('ts_ls', {
  on_attach = function(client, bufnr)
    ts_utils.setup({
      filter_out_diagnostics_by_code = { 80001 },
    })
    ts_utils.setup_client(client)
    on_attach(client, bufnr)
  end,
})
