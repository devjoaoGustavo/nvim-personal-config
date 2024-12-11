return {
  'prettier/vim-prettier',
  run = 'yarn install --frozen-lockfile --production',
  opts = {
    bin = 'prettierd',   -- or `'prettierd'` (v0.23.3+)
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
      "toml",
      "yaml",
      "yml",
    },
  },
  config = function()
  end
}
