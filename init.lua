local vim = vim

require('core.vim_options')

-- stdpath('data') is ~/.local/share/nvim by default
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('core')
require("lazy").setup("plugins")

require("telescope").setup {
  defaults = {
    layout_strategy = 'vertical',
    layout_config = { height = 0.95, width = 0.4, prompt_position = "top" },
    scroll_strategy = 'limit',
    sorting_strategy = 'ascending',
    wrap_results = true,
    preview = {
      filesize_limit = 0,
      timeout = 50,
      treesitter = { enable = false }
    },
    mappings = {
      i = {
        ["<esc>"] = "close",
        ["<Down>"] = "cycle_history_next",
        ["<Up>"] = "cycle_history_prev",
        ["<c-j>"] = "move_selection_next",
        ["<c-k>"] = "move_selection_previous",
        ["<c-n>"] = false,
        ["<c-p>"] = false,
      },
    }
  },
  extensions = {}
}
pcall(require("telescope").load_extension, 'fzf_native')

-- setup must be called before loading
vim.cmd.colorscheme "gruvbox"
-- vim: ts=2 sts=2 sw=2
