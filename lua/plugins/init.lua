local vim = vim

-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  -- use 'christoomey/vim-tmux-navigator'
  use 'fannheyward/telescope-coc.nvim'
  use { 'hashivim/vim-terraform' }
  use 'jremmen/vim-ripgrep'
  use 'numToStr/Comment.nvim'
  use 'preservim/nerdtree'
  -- use 'preservim/vimux'
  use 'sainnhe/gruvbox-material'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  -- use 'tpope/vim-rhubarb'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'wakatime/vim-wakatime'
  use 'windwp/nvim-autopairs'
  use { 'elixir-lsp/coc-elixir', run = 'yarn install && yarn prepack' }
  -- use 'elixir-editors/vim-elixir'
  -- use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' } }
  use { 'neoclide/coc.nvim', branch = 'release' }
  use { 'j-hui/fidget.nvim', tag = 'legacy' }
  use { 'neovim/nvim-lspconfig', requires = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' } }
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-treesitter/nvim-treesitter', run = function() pcall(require('nvim-treesitter.install').update { with_sync = true }) end }
  use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter', requires =
  'nvim-treesitter/nvim-treesitter' }
  use { 'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' }
  -- use { 'toppair/peek.nvim', run = 'deno task --quiet build:fast' }
  -- use({ "folke/noice.nvim", requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify", } })
  -- use({ "jackMort/ChatGPT.nvim", config = function() require("chatgpt").setup() end,
  --   requires = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" } })
  -- use({ "kdheepak/lazygit.nvim", requires = { "nvim-lua/plenary.nvim" } })
  -- use { "ahmedkhalf/project.nvim", config = function() require("project_nvim").setup {} end }
  -- use { 'notjedi/nvim-rooter.lua', config = function() require 'nvim-rooter'.setup() end }
  use({
    'ramojus/mellifluous.nvim',
    config = function() require('mellifluous').setup({ dim_inactive = false, color_set = 'mellifluous', }) end,
    requires = { 'rktjmp/lush.nvim' },
  })
  use 'ziglang/zig.vim'
  use 'shaunsingh/nord.nvim'
  use {
    'lukas-reineke/headlines.nvim',
    after = 'nvim-treesitter',
    config = function()
      require('headlines').setup({
        markdown = {
          headline_highlights = {
            "Headline1",
            "Headline2",
            "Headline3",
            "Headline4",
            "Headline5",
            "Headline6",
          },
          codeblock_highlight = "CodeBlock",
          dash_highlight = "Dash",
          quote_highlight = "Quote",
        },
      })
    end,
  }
  -- use 'andymass/vim-matchup'
  -- use 'lewis6991/gitsigns.nvim'
  -- use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
  use 'knsh14/vim-github-link'

  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then plugins(use) end
  if is_bootstrap then require('packer').sync() end
end)
