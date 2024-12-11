return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        theme = 'auto',
        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 500,
          tabline = 500,
          winbar = 500,
        }
      },
      sections = {
        lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } },
        lualine_b = { 'branch' },
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'encoding', 'fileformat' },
        lualine_y = { 'progress', 'location' },
        lualine_z = { 'filetype' }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {
        -- lualine_a = {},
        lualine_a = {
          {
            'tabs',
            mode = 2,
            max_length = vim.opt.columns._value,
            tab_max_length = 40,
            use_mode_colors = true
          }
        },
        lualine_b = {},
        lualine_c = {
          'navic',
          color_correction = nil,
          navic_opts = nil
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      },
      extensions = {}
    }
  end
}
