require('core.diagnostic_config')
require('core.keymaps_config')
require('core.autocmd')

vim.keymap.set("n", "<leader>n", vim.cmd.NvimTreeFindFileToggle,
  { noremap = true, silent = true })
