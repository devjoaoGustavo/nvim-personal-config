local lib = require("telescope")

lib.setup {
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

lib.load_extension('coc')
