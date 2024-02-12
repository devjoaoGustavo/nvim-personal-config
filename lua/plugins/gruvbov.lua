return {
  "ellisonleao/gruvbox.nvim",
  opts = {
    terminal_colors = true, -- add neovim terminal colors
    undercurl = false,
    underline = false,
    bold = true,
    italic = {
      strings = true,
      emphasis = true,
      comments = true,
      operators = false,
      folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = "hard", -- can be "hard", "soft" or empty string
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = false,
   --  overrides = {
   --    SignColumn = {bg = "#1d2021"}
   --  }
  }
}
