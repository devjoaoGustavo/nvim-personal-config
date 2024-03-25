local vim = vim

local keyset = vim.keymap.set

keyset({ 'n', 'v' }, '<space>', '<Nop>', { silent = true })

keyset('n', 'gh', ':MixFormat<cr>', { noremap = true, silent = true })

keyset('t', '<esc>', '<C-\\><C-n>', { silent = true })
keyset('n', '<esc><esc>', ':w<cr>', { silent = true })
keyset('n', 'gb', ':G blame<cr>', { noremap = true, silent = true })
keyset('n', 'gl', '<cmd>Gitsigns blame_line<cr>', { noremap = true, silent = true })
keyset('n', 'gy', ':let @+ = expand("%")<cr>', { silent = true, noremap = true })

keyset('n', 'gv', ':Format<cr>', { silent = true })
keyset('n', '<leader>hl', vim.cmd.nohl, { silent = true })

vim.api.nvim_create_user_command("Format", function() vim.lsp.buf.format { async = true } end, {})

