-- vim.opt.termguicolors = true
vim.opt.foldmethod = "syntax"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldminlines = 3
vim.opt.foldlevelstart = 1

local c = require('vscode.colors')
require('vscode').setup({
    -- Override highlight groups (see ./lua/vscode/theme.lua)
    group_overrides = {
        -- this supports the same val table as vim.api.nvim_set_hl
        -- use colors from this colorscheme by requiring vscode.colors!
        Cursor = { fg=c.vscBlack, bg=c.vscRed, bold=false },
    }
})
