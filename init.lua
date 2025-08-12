require("config.lazy")
require('core')
require('config')
local opts = { silent = true, noremap = true }
vim.keymap.set('n', '<space><space>x', ':%lua<cr>', opts)
vim.keymap.set('v', '<space>x', ':lua<cr>', opts)


vim.cmd [[
   set cc=+1	  " highlight column after 'textwidth'
   " set cc=+1,+2,+3  " highlight three columns after 'textwidth'
   hi ColorColumn ctermbg=lightgrey guibg=lightgrey
]]
