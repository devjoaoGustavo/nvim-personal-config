return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      require('lualine').setup {
        options = {
          theme = 'auto',
          section_separators = {'', ''},
          component_separators = {'', ''},
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {},
          lualine_c = {'location'},
          lualine_x = {'encoding', 'fileformat'},
          lualine_y = {'progress'},
          lualine_z = {'filetype'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {
          lualine_a = {},
          lualine_b = {'branch'},
          lualine_c = {{ 'filename', path = 1 }},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        },
        extensions = {'nvim-tree'}
      }
    end
}
