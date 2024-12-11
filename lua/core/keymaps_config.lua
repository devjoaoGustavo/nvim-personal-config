local vim = vim

vim.keymap.set({ 'n', 'v' }, '<space>', '<Nop>', { silent = true })

vim.keymap.set('t', '<esc>', '<C-\\><C-n>', { silent = true })
vim.keymap.set('n', '<esc><esc>', ':w!<cr>', { silent = true })
vim.keymap.set('n', 'gb', ':G blame<cr>', { noremap = true, silent = true })
-- keyset('n', 'gl', '<cmd>Gitsigns blame_line<cr>', { noremap = true, silent = true })
vim.keymap.set('n', 'gs', '<cmd>Neogit<cr>', { noremap = true, silent = true })
vim.keymap.set('n', 'gy', ':let @+ = expand("%")<cr>', { silent = true, noremap = true })

vim.keymap.set('n', '<leader>hl', vim.cmd.nohl, { silent = true })

-- Vimux
vim.keymap.set('n', '<leader>vv', ':VimuxPromptCommand<cr>', { silent = true })
vim.keymap.set('n', '<leader>vs', ':VimuxRunLastCommand<cr>', { silent = true })
vim.keymap.set('n', '<leader>ll', ':VimuxRunCommand("mix test ".expand("%").":".line("."))<cr>', { silent = true })
vim.keymap.set('n', '<leader>lt', ':VimuxRunCommand("mix test ".expand("%"))<cr>', { silent = true })

vim.keymap.set('n', ']g', ':Gitsigns next_hunk<cr>', { silent = true })
vim.keymap.set('n', '[g', ':Gitsigns prev_hunk<cr>', { silent = true })
vim.keymap.set('n', 'yga', ':Gitsigns stage_hunk<cr>', { silent = true })
vim.keymap.set('n', 'ygd', ':Gitsigns toggle_linehl<cr>', { silent = true })
vim.keymap.set('n', 'ygh', ':Gitsigns toggle_linehl<cr>', { silent = true })

vim.keymap.set('n', '-', ':Ex<cr>', { silent = true })

vim.keymap.set(
  'n', '<c-p>', require('telescope.builtin').find_files,
  { silent = true, noremap = true, desc = '[S]earch git tracked [F]iles' }
)


vim.keymap.set(
  "n",
  "<leader>n",
  function() require('nvim-tree.api').tree.toggle({ find_file = true }) end,
  { silent = true, noremap = true, desc = 'NvimTree: Toggle' }
)

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

vim.keymap.set('n', 'gpn', ':Now<cr>', { silent = true, noremap = true })
