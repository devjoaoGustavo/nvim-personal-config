-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
  options = {
    globalstatus = true,
    icons_enabled = false,
    theme = 'github_dark_default',
    component_separators = '|',
    section_separators = '',
  },
}

