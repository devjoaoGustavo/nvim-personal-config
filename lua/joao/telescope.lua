local lib = require("telescope")

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
lib.setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(lib.load_extension, 'fzf')

lib.setup {
  defaults = {
    results_title = 'Results',
    layout_strategy = 'center',
    layout_config = {
      height = 0.95,
      prompt_position = 'top',
    },
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

-- lib.load_extension('coc')
