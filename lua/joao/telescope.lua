local lib = require("telescope")

lib.setup {
  defaults = {
    -- results_title = 'Results',
    -- layout_strategy = 'center',
    -- layout_config = {
    --   height = 0.95,
    --   prompt_position = 'top',
    -- },
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close,
      },
    }
  },
  pickers = {
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close,
      },
      n = {
        ["<esc>"] = require('telescope.actions').close,
      },
    }
  }
}

pcall(lib.load_extension, 'fzf')
pcall(lib.load_extension('coc'))
-- lib.load_extension('projects')
