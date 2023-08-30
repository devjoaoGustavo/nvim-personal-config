local vim = vim

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

local plugins = {
  'christoomey/vim-tmux-navigator',
  'fannheyward/telescope-coc.nvim',
  'github/copilot.vim',
  'hashivim/vim-terraform',
  'jremmen/vim-ripgrep',
  'knsh14/vim-github-link',
  'mhinz/vim-mix-format',
  'neovim/nvim-lspconfig',
  'numToStr/Comment.nvim',
  'sainnhe/gruvbox-material',
  'tpope/vim-fugitive',
  'tpope/vim-repeat',
  'tpope/vim-surround',
  'tpope/vim-unimpaired',
  'wakatime/vim-wakatime',
  'windwp/nvim-autopairs',
  'ziglang/zig.vim',
  { 'elixir-lsp/coc-elixir', dependencies = { 'neoclide/coc.nvim' }, build = 'yarn install && yarn prepack' },
  { 'neoclide/coc.nvim', branch = 'release' },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable('make') == 1 },
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
  { 'nvim-tree/nvim-tree.lua', dependencies = { 'nvim-tree/nvim-web-devicons'}, },
  { 'nvim-treesitter/nvim-treesitter', build = function() pcall(require('nvim-treesitter.install').update { with_sync = true }) end },
  { 'nvim-treesitter/nvim-treesitter-textobjects', dependencies = { 'nvim-treesitter/nvim-treesitter' } },
  { 'prettier/vim-prettier', build = 'yarn install --frozen-lockfile --production' },
  { 'rose-pine/neovim', name = 'rose-pine' }
}

require("lazy").setup(plugins)
