local vim = vim

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = "double"
  }
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signatureHelp, {
    border = "single"
  }
)
vim.diagnostic.config({ float = { border = "single" } })

--
local servers = {
  gopls = {
    cmd = { 'gopls', 'serve' },
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
  elixirls = {
    filetypes = { 'elixir', 'eelixir' },
    cmd = { '/Users/joao/.local/share/nvim/site/pack/packer/start/coc-elixir/els-release/language_server.sh' },
    root_dir = vim.fn.getcwd(),
  },
  rust_analyzer = {
    cmd = { 'rust-analyzer' },
  },
  solargraph = {
    filetypes = { 'ruby', 'eruby' },
    cmd = { 'solargraph', 'stdio' },
  },
  zls = {
    filetypes = { 'zig' },
    cmd = { 'zls' },
  },
  marksman = {
    filetypes = { 'markdown' },
    cmd = { 'marksman' },
  },
  lua_ls = {
    filetypes = { 'lua' },
    cmd = { 'lua-language-server' },
    root_dir = vim.fs.dirname(vim.fs.find({ '.git' }, { upward = true })[1]),
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
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

local on_attach = function(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

  vim.keymap.set('n', '<space>lf', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, silent = true })
-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, { noremap = true, silent = true })

--
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
--
-- -- Setup mason so it can manage external tooling
-- require('mason').setup()
--
-- -- Ensure the servers above are installed
-- local mason_lspconfig = require 'mason-lspconfig'
--
-- -- Setup the servers with nvim-lspconfig
for server_name, config in pairs(servers) do
  require('lspconfig')[server_name].setup {
    -- capabilities = capabilities,
    on_attach = on_attach,
    cmd = config.cmd,
    -- init_options = {
    --   enabledFeatures = enabled_features,
    -- },
    autostart = true,
    settings = config,
  }
end

-- --
-- --
-- -- local configs = require("lspconfig.configs")
-- -- local util = require("lspconfig.util")
-- --
-- -- if not configs.ruby_lsp then
-- --   configs.ruby_lsp = {
-- --     default_config = {
-- --       cmd = { "bundle", "exec", "ruby-lsp" },
-- --       filetypes = { "ruby" },
-- --       root_dir = util.root_pattern("Gemfile", ".git"),
-- --       init_options = {
-- --         enabledFeatures = enabled_features,
-- --       },
-- --       settings = {},
-- --     },
-- --     commands = {
-- --       FormatRuby = {
-- --         function()
-- --           vim.lsp.buf.format({
-- --             name = "ruby_lsp",
-- --             async = true,
-- --           })
-- --         end,
-- --         description = "Format using ruby-lsp",
-- --       },
-- --     },
-- --   }
-- -- end
--
-- -- lspconfig.ruby_lsp.setup({ on_attach = on_attach, capabilities = capabilities })
-- -- require("lspconfig").ruby_lsp.setup({ on_attach = on_attach })
