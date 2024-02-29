local vim = vim

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')

    -- pcall(lib.load_extension('coc'))
    -- pcall(lib.load_extension('file_browser'))
    -- lib.load_extension('projects')

    -- vim.api.nvim_set_keymap('n', 'gp', ':Telescope projects<cr>', { silent = true, noremap = true })
    vim.keymap.set('n', '<leader>fg', builtin.git_files,
      { silent = true, noremap = true, desc = '[S]earch [F]iles tracked by GIT' })
    vim.keymap.set('n', '<leader>/', builtin.live_grep,
      { silent = true, noremap = true, desc = '[/] Fuzzily search in current buffer]' })
    vim.keymap.set('n', '<leader>?', builtin.oldfiles,
      { silent = true, noremap = true, desc = '[?] Find recently opened files' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers,
      { silent = true, noremap = true, desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics,
      { silent = true, noremap = true, desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<c-p>', builtin.find_files, { silent = true, noremap = true, desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { silent = true, noremap = true, desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { silent = true, noremap = true, desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>bs', builtin.lsp_document_symbols, { silent = true, noremap = true, desc = 'Search [B]uffer [S]symbols' })
  end
}
