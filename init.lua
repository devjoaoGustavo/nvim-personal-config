local vim = vim

require('options')
require('plugins')
require('joao')
require('lsp')
require('nvim-tree').setup()

vim.o.background = 'dark'
vim.g.gruvbox_material_foreground = 'original'
vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_enable_bold = true
vim.g.gruvbox_material_enable_italic = true
vim.g.gruvbox_material_disable_italic_comment = false
vim.g.gruvbox_material_dim_inactive_windows = false
vim.g.gruvbox_material_better_performance = true
vim.g.gruvbox_material_show_eob = false
vim.g.gruvbox_material_visual = 'green background'
vim.g.gruvbox_material_ui_contrast = 'high'
vim.g.gruvbox_material_statusline_style = 'original'
vim.cmd.colorscheme 'gruvbox-material'

require('autocmd')
-- vim: ts=2 sts=2 sw=2
