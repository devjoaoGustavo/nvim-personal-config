local vim = vim

local keyset = vim.keymap.set

keyset({ 'n', 'v' }, '<space>', '<Nop>', { silent = true })

keyset('n', 'gh', ':MixFormat<cr>', { noremap = true, silent = true })

keyset('t', '<esc>', '<C-\\><C-n>', { silent = true })
keyset('n', '<esc><esc>', ':w<cr>', { silent = true })
keyset('n', 'gb', ':G blame<cr>', { noremap = true, silent = true })
keyset('n', 'gy', ':let @+ = expand("%")<cr>', { silent = true, noremap = true })

keyset('n', 'gv', vim.lsp.buf.format, { silent = true })
keyset('n', '<leader>hl', vim.cmd.nohl, { silent = true })

keyset(
  "n",
  "<leader>n",
  vim.cmd.NvimTreeToggle,
  { noremap = true, silent = true }
)
keyset(
  "n",
  "<leader>f",
  vim.cmd.NvimTreeFindFileToggle,
  { noremap = true, silent = true }
)
