local vim = vim

require('options')
require('plugins')
require('joao')

vim.o.background = 'dark'
vim.g.gruvbox_material_foreground = 'material'
vim.g.gruvbox_material_background = 'hard'
vim.cmd.colorscheme 'gruvbox-material'

require('autocmd')
-- vim: ts=2 sts=2 sw=2
