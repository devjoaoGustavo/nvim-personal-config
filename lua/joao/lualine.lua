require('lualine').setup {
  options = {
    globalstatus = false,
    icons_enabled = false,
    theme = 'auto',
    component_separators = { left = nil, right = nil },
    section_separators = { left = nil, right = nil },
    -- color = {
    --   bg = 'black',
    --   fg = 'brightwhite',
    -- },
  },
  sections = {
    lualine_a = {
      { 'mode', fmt = function(str) return str:sub(1, 1) end, separator = { left = nil, right = '' } }
    },
    lualine_b = {
      { 'branch',      separator = { left = nil, right = '' } },
      { 'diff',        separator = { left = nil, right = '' } },
      { 'diagnostics', separator = { left = nil, right = '' } }
    },
    lualine_c = {
      {
        'filename',
        file_status = true,     -- Displays file status (readonly status, modified status)
        newfile_status = false, -- Display new file status (new file means no write after created)
        path = 1,               -- 0: Just the filename
        separator = { left = nil, right = '' },
        -- 1: Relative path
        -- 2: Absolute path
        -- 3: Absolute path, with tilde as the home directory
        -- 4: Filename and parent dir, with tilde as the home directory

        shorting_target = 40, -- Shortens path to leave 40 spaces in the window
        -- for other components. (terrible name, any suggestions?)
        symbols = {
          modified = '[+]',      -- Text to show when the file is modified.
          readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
          unnamed = '[No Name]', -- Text to show for unnamed buffers.
          newfile = '[New]',     -- Text to show for newly created file before first write
        },
        -- color = {
        --   bg = 'black',
        --   fg = 'brightwhite',
        -- },
      }
    },
    lualine_x = {
      { 'encoding',   separator = { left = '', right = nil } },
      { 'fileformat', separator = { left = '', right = nil } },
      { 'filetype',   separator = { left = '', right = nil } }
    },
    lualine_y = {
      { 'progress', separator = { left = '', right = nil } }
    },
    lualine_z = {
      { 'location', separator = { left = '', right = nil } }
    }
  },
}
