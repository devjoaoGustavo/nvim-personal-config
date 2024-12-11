return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      local cmp = require('cmp')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources(
          {
            { name = 'copilot' },
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
          },
          {
            { name = 'buffer' },
          }
        )
      })

      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        }),
        matching = { disallow_symbol_nonprefix_matching = false }
      })


      lspconfig.lua_ls.setup {
        capabilities = capabilities,
        cmd = { 'lua-language-server' },
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' },
            },
            workspace = {
              library = { vim.env.VIMRUNTIME },
            },
          },
        },
      }
      lspconfig.elixirls.setup {
        capabilities = capabilities,
        cmd = { 'elixir-ls' },
        settings = {
          elixirLS = {
            dialyzerEnabled = true,
            fetchDeps = true,
            mixEnv = 'test',
            mixTarget = 'host'
          },
        },
      }
      lspconfig.ts_ls.setup { capabilities = capabilities, }
      lspconfig.terraformls.setup {
        capabilities = capabilities,
        cmd = { 'terraform-ls', 'serve' },
        filetypes = { 'hcl', 'tf', 'terraform' }
      }
      lspconfig.marksman.setup { capabilities = capabilities, cmd = { 'marksman', 'server' } }
      lspconfig.ruby_lsp.setup({ capabilities = capabilities })

      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local options = { buffer = ev.buf }
          vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>', options)
          vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
          end, options)


          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client.supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
          end

          if client.supports_method('textDocument/formatting') then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = ev.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = ev.buf, id = client.id })
              end,
            })
          end
        end,
      })
    end,
    dependencies = {
      "hrsh7th/nvim-cmp"
    }
  }
}
