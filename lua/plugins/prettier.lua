return {
  'MunifTanjim/prettier.nvim',
  run = 'yarn install',
  opts = {
    bin = 'prettier',   -- or `'prettierd'` (v0.23.3+)
    filetypes = {
      "css",
      "graphql",
      "html",
      "javascript",
      "javascriptreact",
      "json",
      "less",
      "markdown",
      "scss",
      "typescript",
      "typescriptreact",
      "yaml",
    },
  },
}
