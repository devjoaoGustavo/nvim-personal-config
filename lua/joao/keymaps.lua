vim.api.nvim_set_keymap('n', '<c-h>', '<c-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-j>', '<c-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-k>', '<c-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-l>', '<c-w>l', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'gz', ':e ~/.config/nvim/init.lua<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gx', ':so ~/.config/nvim/init.lua<cr>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<space><space>', '<c-^>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>n', vim.cmd.NERDTreeToggle, { silent = true })
vim.keymap.set('n', '<leader>f', vim.cmd.NERDTreeFind, { silent = true })
vim.keymap.set('n', '<leader>hl', vim.cmd.nohl, { silent = false })

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>bl', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.api.nvim_set_keymap('n', '<leader>sf', "require('telescope.builtin').find_files", { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<c-p>', function()
  require('telescope.builtin').git_files(require('telescope.themes').get_dropdown {
    order = 'reverse',
    previewer = false,
  })
end, { desc = '[S]earch [F]iles tracked by GIT' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Diagnostic apis
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, {})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, {})
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {})
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, {})

