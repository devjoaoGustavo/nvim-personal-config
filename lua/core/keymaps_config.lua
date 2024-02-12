local vim = vim

local keyset = vim.keymap.set

vim.keymap.set({ 'n', 'v' }, '<space>', '<Nop>', { silent = true })

keyset('n', '<F6>', ':MixFormat', { noremap = true, silent = true })

keyset('t', '<esc>', '<C-\\><C-n>', { silent = true })
keyset('n', '<esc><esc>', ':w<cr>', { silent = true })
keyset('n', 'gb', ':G blame<cr>', { noremap = true, silent = true })
keyset('n', 'gy', ':let @+ = expand("%")<cr>', { silent = true, noremap = true })

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

vim.keymap.set('n', '<leader>hf', vim.lsp.buf.format, { silent = true })
vim.keymap.set('n', '<leader>hl', vim.cmd.nohl, { silent = true })

if not vim.g.vscode then
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
end
