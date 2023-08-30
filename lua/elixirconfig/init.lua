local elixir = require("elixir")
local elixirls = require("elixir.elixirls")
local vim = vim

elixir.setup({
  nextls = { enable = false },
  credo = { enable = true },
  elixirls = {
    enable = true,
    root_dir = function(_) vim.fs.dirname(vim.fs.find({'.git', 'mix.lock'}, { upward = true })[1]) end,
    settings = elixirls.settings {
      dialyzerEnabled = true,
      fetchDeps = false,
      enableTestLenses = true,
      suggestSpecs = false,
    },
    on_attach = function(client, bufnr)
      vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
      vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
      vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })
    end
  },
})
