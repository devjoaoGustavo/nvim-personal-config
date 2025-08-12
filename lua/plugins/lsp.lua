return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require('lspconfig')
      local capabilities = require('blink.cmp').get_lsp_capabilities()
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

      lspconfig.clangd.setup {
        capabilities = capabilities,
      }

      function get_elixir_stdlib_dir()
        -- Construct the Elixir command
        local elixir_command = 'elixir -e ":code.lib_dir(:elixir) |> IO.puts()"'

        -- Execute the command and capture the output
        local handle = io.popen(elixir_command)
        if not handle then
          return nil, "Failed to execute elixir command."
        end

        local result = handle:read("*a") -- Read all output
        handle:close()

        -- Remove trailing newline characters (if any)
        result = result:gsub("[\n\r]+$", "")

        return result
      end

      lspconfig.elixirls.setup {
        capabilities = capabilities,
        cmd = { 'elixir-ls' },
        settings = {
          elixirLS = {
            autoBuild = true,
            dialyzerEnabled = true,
            dialyzerFormat = 'dialyxir_long',
            fetchDeps = true,
            mixEnv = 'test',
            mixTarget = 'host',
            suggestSpecs = true,
            signatureAfterComplete = true,
            stdlibSrcDir = get_elixir_stdlib_dir()
          },
        },
      }

      lspconfig.gopls.setup {
        capabilities = capabilities,
        cmd = { 'gopls' },
        settings = {
          gopls = {
            usePlaceholders = true,
            completeUnimported = true,
            staticcheck = true,
            analyses = {
              unusedparams = true,
              shadow = true,
              fieldalignment = true,
            },
          },
        },
      }

      lspconfig.terraformls.setup { capabilities = capabilities, }
      -- lspconfig.ruby_lsp.setup({})

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { silent = true, noremap = true })


          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          -- local options = { buffer = ev.buf }
          -- vim.keymap.set('n', '<space>fmt', function()
          --   vim.lsp.buf.format { async = true }
          -- end, options)


          if client and client.supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
          end

          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          if client and client.supports_method('textDocument/formatting') then
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
    end
  }
}
