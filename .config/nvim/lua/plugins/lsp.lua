return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "b0o/schemastore.nvim",
      "jose-elias-alvarez/nvim-lsp-ts-utils",
    },
    config = function()
      local km = vim.keymap

      km.set("n", "<space>q", vim.diagnostic.setloclist)

      local on_attach = function(client, bufnr)
        vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        km.set("n", "gD", vim.lsp.buf.declaration, bufopts)
        km.set("n", "gd", vim.lsp.buf.definition, bufopts)
        km.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
        km.set("n", "<space>h", vim.lsp.buf.hover, bufopts)
        km.set("n", "gi", vim.lsp.buf.implementation, bufopts)
        km.set("n", "<leader>s", vim.lsp.buf.signature_help, bufopts)
        km.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
        km.set("n", "<leader>.", vim.lsp.buf.code_action, bufopts)
        km.set("n", "<space>gr", vim.lsp.buf.references, bufopts)
        km.set("n", "<space>f", function()
          vim.lsp.buf.format({ async = true })
        end, bufopts)

        -- Turn off formatting for servers where there is a formatter setup with nullls
        if client.name == "ts_ls" or client.name == "jsonls" or client.name == "svelte" then
          client.server_capabilities.document_formatting = false
        end
      end

      local g = vim.g
      g.markdown_fenced_languages = {
        "ts=typescript",
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      -- apply config to all lsp
      vim.lsp.config("*", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      -- enable the language servers
      vim.lsp.enable({ "bashls", "dockerls", "eslint", "gopls", "rubocop", "svelte", "vuels", "yamlls" })

      vim.lsp.config("denols", {
        single_file_support = false,
      })
      vim.lsp.config("ruby_lsp", {
        root_markers = { "Gemfile" },
      })
      vim.lsp.config("elixirls", {
        cmd = { vim.env.HOMEBREW_PREFIX .. "/bin/elixir-ls" },
      })
      vim.lsp.config("jsonls", {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      })
      vim.lsp.config("omnisharp", {
        cmd = { vim.env.HOME .. "/.cache/omnisharp-vim/omnisharp-roslyn/OmniSharp" },
        enable_roslyn_analyzers = true,
        organize_imports_on_format = true,
      })
      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            assist = {
              importGranularity = "module",
              importPrefix = "self",
            },
            cargo = {
              loadOutDirsFromCheck = true,
            },
            procMacro = {
              enable = true,
            },
          },
        },
      })
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
          },
        },
      })
      vim.lsp.config("tailwindcss", {
        init_options = {
          userLanguages = {
            elixir = "html-eex",
            eelixir = "html-eex",
            heex = "html-eex",
          },
        },
      })
      local ts_utils = require("nvim-lsp-ts-utils")
      vim.lsp.config("ts_ls", {
        on_attach = function(client, bufnr)
          ts_utils.setup({
            filter_out_diagnostics_by_code = { 80001 },
          })
          ts_utils.setup_client(client)
          on_attach(client, bufnr)
        end,
      })
    end,
  },
}
