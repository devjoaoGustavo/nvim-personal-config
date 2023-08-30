local vim = vim

vim.lsp.start({
  name = 'elixirls',
  cmd = {'elixir-ls'},
  root_dir = vim.fs.dirname(vim.fs.find({'.git', 'mix.lock'}, { upward = true })[1]),
})

