local vim = vim

local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

local servers = {
  gopls = {},
  elixirls = {},
  rust_analyzer = {},
  solargraph = {},
  zls = {},
  marksman = {
    filetypes = { 'markdown' },
  },
  sumneko_lua = {
    filetypes = { 'lua' },
  },
}

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = {
    'rust_analyzer',
    'solargraph',
    'marksman',
    'lua_ls',
    'elixirls'
  },
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      -- capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}
--
vim.api.nvim_set_keymap('n', 'gd', ':Telescope coc definitions<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', ':Telescope coc references_used<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gi', ':Telescope coc implementations<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gs', ':Telescope coc document_symbols<cr>', {})


local lspconfig = require("lspconfig")
local configs = require("lspconfig.configs")
local util = require("lspconfig.util")

if not configs.ruby_lsp then
  local enabled_features = {
    "documentHighlights",
    "documentSymbols",
    "foldingRanges",
    "selectionRanges",
    -- "semanticHighlighting",
    "formatting",
    "codeActions",
  }

  configs.ruby_lsp = {
    default_config = {
      cmd = { "bundle", "exec", "ruby-lsp" },
      filetypes = { "ruby" },
      root_dir = util.root_pattern("Gemfile", ".git"),
      init_options = {
        enabledFeatures = enabled_features,
      },
      settings = {},
    },
    commands = {
      FormatRuby = {
        function()
          vim.lsp.buf.format({
            name = "ruby_lsp",
            async = true,
          })
        end,
        description = "Format using ruby-lsp",
      },
    },
  }
end

-- lspconfig.ruby_lsp.setup({ on_attach = on_attach, capabilities = capabilities })
lspconfig.ruby_lsp.setup({ on_attach = on_attach })
