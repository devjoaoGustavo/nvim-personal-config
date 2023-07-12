local vim = vim

-- vim.api.nvim_create_autocmd('BufWritePost', {
--   command = 'source <afile> | silent! LspRestart | PackerCompile',
--   group = vim.api.nvim_create_augroup('Packer', { clear = true }),
--   pattern = vim.fn.expand '$MYVIMRC'
-- })
-- vim.api.nvim_create_autocmd('TermOpen', { command = 'startinsert' })
vim.api.nvim_create_autocmd('BufWritePre',
  {
    callback = function() vim.lsp.buf.format({ name = "elixirls" }) end,
    pattern = { "*.ex", "*.exs", "*.erl", "*.yrl", "*.xrl", "*.eex", "*.leex", "*.heex" }
  })
vim.api.nvim_create_autocmd('BufWritePre', { pattern = { "*" }, command = [[%s/\s\+$//e]] })
-- vim.api.nvim_create_autocmd('TextYankPost',
  -- {
  --   callback = function() vim.highlight.on_yank() end,
  --   group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }),
  --   pattern = '*',
  -- })
