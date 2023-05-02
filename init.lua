local vim = vim

-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end

vim.cmd [[nnoremap <silent> gy :let @+ = expand("%")<cr>]]

require('packer').startup(function(use)
  use 'christoomey/vim-tmux-navigator'
  use 'elixir-editors/vim-elixir'
  use 'fannheyward/telescope-coc.nvim'
  use 'hashivim/vim-terraform'
  use 'jremmen/vim-ripgrep'
  use 'numToStr/Comment.nvim'
  use 'preservim/nerdtree'
  use 'preservim/vimux'
  use 'sainnhe/gruvbox-material'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-repeat'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-surround'
  use 'tpope/vim-unimpaired'
  use 'wakatime/vim-wakatime'
  use 'wbthomason/packer.nvim'
  use 'windwp/nvim-autopairs'
  use { "ellisonleao/gruvbox.nvim" }
  use { 'elixir-lsp/coc-elixir', run = 'yarn install && yarn prepack' }
  use { 'hrsh7th/nvim-cmp', requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' }, }
  use { 'neoclide/coc.nvim', branch = 'release' }
  use { 'neovim/nvim-lspconfig', requires = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', 'j-hui/fidget.nvim', }, }
  use { 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons', opt = true } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }
  use { 'nvim-treesitter/nvim-treesitter', run = function() pcall(require('nvim-treesitter.install').update { with_sync = true }) end, }
  use { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter', requires = 'nvim-treesitter/nvim-treesitter' }
  use { 'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production' }
  use { 'toppair/peek.nvim', run = 'deno task --quiet build:fast' }
  use({ "folke/noice.nvim", requires = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify", } })
  use({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7', config = function() require('github-theme').setup {} end })
  -- use 'andymass/vim-matchup'
  -- use 'lewis6991/gitsigns.nvim'
  -- use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then plugins(use) end
  if is_bootstrap then require('packer').sync() end
end)

vim.g.mapleader = ' '
vim.g.maplocalleader = ','

-- Load my stuff
require('joao')

vim.g.coc_global_extensions = {
  'coc-json',
  'coc-git',
  'coc-solargraph',
  'coc-tsserver',
  'coc-pairs',
  'coc-git',
  'coc-highlight',
  'coc-emmet',
  'coc-snippets',
  'coc-rust-analyzer',
  'coc-lua',
  'coc-prettier',
  'coc-go'
}

vim.cmd [[colorscheme github_dark_default]]

vim.api.nvim_create_autocmd('BufWritePost', { command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile', group = vim.api.nvim_create_augroup('Packer', { clear = true }), pattern = vim.fn.expand '$MYVIMRC' })
vim.api.nvim_create_autocmd('TermOpen', { command = 'startinsert' })
vim.api.nvim_create_autocmd('BufWritePre', { command = 'lua vim.lsp.buf.format()', pattern = { "*.ex", "*.exs", "*.erl", "*.yrl", "*.xrl", "*.eex", "*.leex", "*.heex" } })
vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*" }, command = [[%s/\s\+$//e]] })
vim.api.nvim_create_autocmd('TextYankPost', { callback = function() vim.highlight.on_yank() end, group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }), pattern = '*', })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'c', 'cpp', 'elixir', 'go', 'lua', 'markdown', 'rust', 'ruby', 'help', 'vim' },

  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<c-backspace>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
        ['at'] = '@test.outer',
        ['it'] = '@test.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = { [']m'] = '@function.outer', [']n'] = '@test.outer', [']]'] = '@class.outer' },
      goto_next_end = { [']M'] = '@function.outer', [']N'] = '@test.outer', [']['] = '@class.outer' },
      goto_previous_start = { ['[m'] = '@function.outer', ['[n'] = '@test.outer', ['[['] = '@class.outer' },
      goto_previous_end = { ['[M'] = '@function.outer', ['[N'] = '@test.outer', ['[]'] = '@class.outer' },
    },
    swap = {
      enable = true,
      swap_next = { ['<leader>a'] = '@parameter.inner' },
      swap_previous = { ['<leader>A'] = '@parameter.inner' },
    },
  },
}

require("noice").setup({
  cmdline = {
    view = "cmdline",
    format = {
      search_down = {
        view = "cmdline",
      },
      search_up = {
        view = "cmdline",
      },
    },
  },
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = true,         -- use a classic bottom cmdline for search
    command_palette = true,       -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = true,            -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true,        -- add a border to hover docs and signature help
  },
  routes = {
    {
      view = "notify",
      filter = { event = "msg_showmode" },
    },
  },
  views = {
    cmdline_popup = {
      position = {
        row = 5,
        col = "50%",
      },
      size = {
        width = 60,
        height = "auto",
      },
    },
    popupmenu = {
      relative = "editor",
      position = {
        row = 8,
        col = "50%",
      },
      size = {
        width = 60,
        height = 10,
      },
      border = {
        style = "rounded",
        padding = { 0, 1 },
      },
      win_options = {
        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
      },
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
