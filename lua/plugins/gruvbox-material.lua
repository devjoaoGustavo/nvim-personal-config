return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  config = function()
    -- Optionally configure and load the colorscheme
    -- directly inside the plugin declaration.
    vim.cmd [[
    let g:gruvbox_material_foreground = 'material'
    let g:gruvbox_material_background = 'hard'
    let g:gruvbox_material_cursor = "red"
    let g:gruvbox_material_enable_bold = 1
    let g:gruvbox_material_enable_italic = 1
    let g:gruvbox_material_show_eob = 0
    let g:gruvbox_material_transparent_background = 1
    ]]
    vim.cmd.colorscheme('gruvbox-material')
  end
}
