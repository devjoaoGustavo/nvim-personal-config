local vim = vim

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  opts = {},
  config = function()
    local builtin = require('telescope.builtin')


    local telescope = require('telescope')

    telescope.setup({
      defaults = {
        layout_config = {
          -- vertical = { width = 0.5, height = 0.4 },
          bottom_pane = {
            height = 25,
            preview_cutoff = 120,
            prompt_position = "top"
          },
        },
        mappings = {
          i = {
            ['<esc>'] = 'close',
            ['<Down>'] = 'cycle_history_next',
            ['<Up>'] = 'cycle_history_prev',
            -- ['<c-j>'] = 'move_selection_next',
            -- ['<c-k>'] = 'move_selection_previous',
            -- ['<c-n>'] = false,
            -- ['<c-p>'] = false,
          },
        }
      },
      extensions = {
        fzf = {}
      },
    })

    -- pcall(lib.load_extension('file_browser'))
    -- lib.load_extension('projects')
    -- -- pcall(lib.load_extension, 'coc')
    pcall(require('telescope').load_extension, 'fzf_native')

    -- vim.api.nvim_set_keymap('n', 'gp', ':Telescope projects<cr>', { silent = true, noremap = true })
    -- vim.keymap.set('n', '<leader>ff', builtin.find_files, { silent = true, noremap = true, desc = '[S]earch [F]iles tracked by GIT' })
    -- vim.keymap.set('n', '<c-p>', builtin.git_files, { silent = true, noremap = true, desc = '[S]earch [F]iles' })
    vim.keymap.set('n', '<leader>/', builtin.live_grep,
      { silent = true, noremap = true, desc = '[/] Fuzzily search in current buffer]' })
    vim.keymap.set('n', '<leader>?', builtin.oldfiles,
      { silent = true, noremap = true, desc = '[?] Find recently opened files' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers,
      { silent = true, noremap = true, desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics,
      { silent = true, noremap = true, desc = '[S]earch [D]iagnostics' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { silent = true, noremap = true, desc = '[S]earch [H]elp' })
    vim.keymap.set('n', '<leader>fcw', builtin.grep_string,
      { silent = true, noremap = true, desc = '[S]earch current [W]ord' })
    vim.keymap.set('v', '<leader>fcw', builtin.grep_string,
      { silent = true, noremap = true, desc = '[S]earch current [W]ord' })
    vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols,
      { silent = true, noremap = true, desc = 'Search [B]uffer [S]symbols' })
    vim.keymap.set('n', '<c-p>', builtin.find_files, { silent = true, noremap = true, desc = '[S]earch [F]iles' })
  end,
}
