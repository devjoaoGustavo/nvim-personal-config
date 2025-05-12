local vim = vim

vim.keymap.set({ 'n', 'v' }, '<space>', '<Nop>', { silent = true })
vim.keymap.set('t', '<esc>', '<C-\\><C-n>', { silent = true })
vim.keymap.set('n', '<esc><esc>', ':w!<cr>', { silent = true })
vim.keymap.set('n', '<space>gb', ':G blame<cr>', { noremap = true, silent = true })
vim.keymap.set('n', 'gy', ':let @+ = expand("%")<cr>', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>hl', vim.cmd.nohl, { silent = true })

-- Vimux
vim.keymap.set('n', '<leader>vv', ':VimuxPromptCommand<cr>', { silent = true })
vim.keymap.set('n', '<leader>vs', ':VimuxRunLastCommand<cr>', { silent = true })
vim.keymap.set('n', '<leader>tl', ':VimuxRunCommand("mix test ".expand("%").":".line("."))<cr>', { silent = true })
vim.keymap.set('n', '<leader>tf', ':VimuxRunCommand("mix test ".expand("%"))<cr>', { silent = true })
vim.keymap.set('n', '<leader>tu', ':VimuxRunCommand("make test")<cr>', { silent = true })
vim.keymap.set('n', '<leader>te', ':VimuxRunCommand("make e2e")<cr>', { silent = true })
vim.keymap.set('n', '<leader>ti', ':VimuxRunCommand("make integration")<cr>', { silent = true })
vim.keymap.set('n', '<leader>tt', ':VimuxRunCommand("make full-test")<cr>', { silent = true })

vim.keymap.set({ 'n', 'v' }, '<space>so', ':sort<cr>')

vim.keymap.set('n', ']g', ':Gitsigns next_hunk<cr>', { silent = true })
vim.keymap.set('n', '[g', ':Gitsigns prev_hunk<cr>', { silent = true })
vim.keymap.set('n', '<space>gs', ':Gitsigns stage_hunk<cr>', { silent = true })
vim.keymap.set('n', '<space>gh', ':Gitsigns toggle_linehl<cr>', { silent = true })

-- Terminal
vim.keymap.set('n', '<M-j>', '<cmd>15sp  term://zsh<cr>', { noremap = true, silent = true })
vim.keymap.set('n', '<M-k>', '<cmd>120vs term://zsh<cr>', { noremap = true, silent = true })

local function print_at_cursor(text)
  -- Get the current buffer and window
  local buf = vim.api.nvim_get_current_buf()
  local win = vim.api.nvim_get_current_win()

  -- Get the current cursor position
  local cursor = vim.api.nvim_win_get_cursor(win)
  local row = cursor[1] - 1 -- Lua indexing starts from 1, but Neovim API uses 0-based
  local col = cursor[2] + 1

  -- Insert the text at the cursor position
  vim.api.nvim_buf_set_text(buf, row, col, row, col, { text })
end

vim.api.nvim_create_user_command(
  'Now',
  function() print_at_cursor(os.date()) end,
  {}
)

vim.keymap.set('n', '<space>tn', ':Now<cr>', { silent = true, noremap = true })

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>df', vim.diagnostic.open_float)
