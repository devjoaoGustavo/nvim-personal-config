local vim = vim

local keyset = vim.keymap.set

vim.keymap.set({ 'n', 'v' }, '<space>', '<Nop>', { silent = true })

keyset('t', '<esc>', '<C-\\><C-n>', { silent = true })
keyset('n', '<esc><esc>', ':w<cr>', { silent = true })
keyset('n', '<space><space>', '<c-^>', { noremap = true, silent = true })
-- keyset('n', '<c-h>', '<c-w>h', { noremap = true, silent = true })
-- keyset('n', '<c-j>', '<c-w>j', { noremap = true, silent = true })
-- keyset('n', '<c-k>', '<c-w>k', { noremap = true, silent = true })
-- keyset('n', '<c-l>', '<c-w>l', { noremap = true, silent = true })
keyset('n', 'gb', ':G blame<cr>', { noremap = true, silent = true })
keyset('n', 'gx', ':so ~/.config/nvim/init.lua<cr>', { noremap = true, silent = true })
keyset('n', 'gz', ':e ~/.config/nvim/init.lua<cr>', { noremap = true, silent = true })
keyset('n', 'gy', ':let @+ = expand("%")<cr>', { silent = true, noremap = true })
-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- vim.keymap.set('n', '<leader>hf', vim.lsp.buf.format, { silent = true })
vim.keymap.set('n', '<leader>hl', vim.cmd.nohl, { silent = true })
-- vim.keymap.set('n', '<leader>f', vim.cmd.NERDTreeFind, { silent = true })
-- vim.keymap.set('n', '<leader>n', vim.cmd.NERDTreeToggle, { silent = true })

--- NetRW
-- vim.keymap.set('n', '-', vim.cmd.Ex, { noremap = true, silent = true })

keyset(
  "n",
  "<space>fb",
  ":Telescope file_browser<CR>",
  { noremap = true }
)

-- toggle Neotree with <leader>n
-- keyset(
--   "n",
--   "<leader>n",
--   ":Neotree toggle<CR>",
--   { noremap = true, silent = true }
-- )

-- nvim-tree
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
