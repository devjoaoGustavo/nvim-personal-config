local vim = vim

require('core.vim_options')

-- stdpath('data') is ~/.local/share/nvim by default
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

require('core.lsp-config')

-- setup must be called before loading
vim.cmd.colorscheme "gruvbox"

-- vim: ts=2 sts=2 sw=2
