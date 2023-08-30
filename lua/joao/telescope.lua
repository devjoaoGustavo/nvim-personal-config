local vim = vim
local lib = require("telescope")

lib.setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close,
      },
    }
  },
  extensions = {
    coc = {
      theme = 'ivy',
      prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
    },

    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
  },
}

pcall(lib.load_extension, 'fzf')
pcall(lib.load_extension('coc'))
-- pcall(lib.load_extension('file_browser'))
-- lib.load_extension('projects')

-- vim.api.nvim_set_keymap('n', 'gp', ':Telescope projects<cr>', { silent = true, noremap = true })
-- vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<c-p>', ":lua require('telescope.builtin').git_files()<cr>", { silent = true, noremap = true, desc = '[S]earch [F]iles tracked by GIT' })
vim.keymap.set('n', '<leader>/', ":lua require('telescope.builtin').live_grep()<cr>", { silent = true, noremap = true, desc = '[/] Fuzzily search in current buffer]' })
vim.keymap.set('n', '<leader>?', ":lua require('telescope.builtin').oldfiles()<cr>", { silent = true, noremap = true, desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>bl', ":lua require('telescope.builtin').buffers()<cr>", { silent = true, noremap = true, desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>sd', ":lua require('telescope.builtin').diagnostics()<cr>", { silent = true, noremap = true, desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sf', ":lua require('telescope.builtin').find_files()<cr>", { silent = true, noremap = true, desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', ":lua require('telescope.builtin').help_tags()<cr>", { silent = true, noremap = true, desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', ":lua require('telescope.builtin').grep_string()<cr>", { silent = true, noremap = true, desc = '[S]earch current [W]ord' })
