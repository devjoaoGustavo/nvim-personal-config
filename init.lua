require("config.lazy")
require('core')
require('config')
local opts = { silent = true, noremap = true }
vim.keymap.set('n', '<space><space>x', ':%lua<cr>', opts)
vim.keymap.set('v', '<space>x', ':lua<cr>', opts)
