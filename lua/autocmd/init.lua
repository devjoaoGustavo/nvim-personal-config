local vim = vim

vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | silent! LspRestart | PackerCompile',
  group = vim.api.nvim_create_augroup('Packer', { clear = true }),
  pattern = vim.fn.expand '$MYVIMRC'
})
vim.api.nvim_create_autocmd('TermOpen', { command = 'startinsert' })
-- vim.api.nvim_create_autocmd('BufWritePost',
--   {
--     command = [[silent :!mix format %]],
--     group = vim.api.nvim_create_augroup('BufWritePostGroup', { clear = true }),
--     pattern = { "*.ex", "*.exs", "*.erl", "*.yrl", "*.xrl", "*.eex", "*.leex", "*.heex" },
--   })
vim.api.nvim_create_autocmd('BufWritePre', { pattern = { "*" }, command = [[%s/\s\+$//e]] })
vim.api.nvim_create_autocmd('TextYankPost',
  {
    callback = function() vim.highlight.on_yank() end,
    group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
    pattern = '*',
  })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    -- vim.keymap.set('n', '<space>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
  end,
})
