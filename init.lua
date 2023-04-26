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
  -- Package manager
  use 'wbthomason/packer.nvim'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-surround'
  use 'sainnhe/gruvbox-material'
  use { "ellisonleao/gruvbox.nvim" }
  use 'preservim/nerdtree'
  use 'christoomey/vim-tmux-navigator'
  use 'preservim/vimux'
  use 'windwp/nvim-autopairs'
  use 'wakatime/vim-wakatime'
  -- use 'andymass/vim-matchup'
  use 'elixir-editors/vim-elixir'
  use 'hashivim/vim-terraform'
  use 'tpope/vim-repeat'
  use { 'toppair/peek.nvim', run = 'deno task --quiet build:fast' }
  use 'jremmen/vim-ripgrep'
  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    },
  }

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
    requires = 'nvim-treesitter/nvim-treesitter'
  }

  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  -- use 'lewis6991/gitsigns.nvim'

  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  -- use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  use { 'neoclide/coc.nvim', branch =  'release' }
  use { 'elixir-lsp/coc-elixir', run = 'yarn install && yarn prepack' }
  use 'fannheyward/telescope-coc.nvim'

  use { 'prettier/vim-prettier', run = 'yarn install --frozen-lockfile --production'}

  use({
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        -- add any options here
      })
    end,
    requires = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  })

  use {
    'nyngwang/NeoTerm.lua',
    config = function ()
      require('neo-term').setup {
        exclude_filetypes = { 'oil' },
        exclude_buftypes = { 'terminal' },
      }
      vim.keymap.set('n', '<M-Tab>', function () vim.cmd('NeoTermToggle') end)
      vim.keymap.set('t', '<M-Tab>', function () vim.cmd('NeoTermEnterNormal') end)
    end
  }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use({
    'projekt0n/github-nvim-theme', tag = 'v0.0.7',
    config = function()
      require('github-theme').setup {}

      -- vim.cmd('colorscheme github_dark')
    end
  })
  -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then
    plugins(use)
  end

  if is_bootstrap then
    require('packer').sync()
  end
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

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | silent! LspStop | silent! LspStart | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})

vim.api.nvim_set_keymap('t', '<esc>', '<C-\\><C-n>', { silent = true })
vim.api.nvim_create_autocmd('TermOpen', { command = 'startinsert' })

vim.api.nvim_create_autocmd('BufWritePre', {
  command = 'lua vim.lsp.buf.format()',
  pattern = {"*.ex", "*.exs", "*.erl", "*.yrl", "*.xrl", "*.eex", "*.leex", "*.heex"}
})
--
-- Attempt to simulate CTRL_R on terminal mode
-- vim.cmd [[tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi']]


-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = ''

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true
vim.o.background = 'dark'
vim.cmd [[colorscheme github_dark_default]]

vim.g.NERDTreeAutoDeleteBuffer = 1
vim.g.NERDTreeMinimalMenu = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeQuitOnOpen = 0
vim.g.NERDTreeShowHidden = 0
vim.g.NERDTreeCascadeSingleChildDir = 0
vim.g.NERDTreeCreatePrefix='silent keepalt keepjumps'
vim.g.plug_window = 'noautocmd vertical topleft new'

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<c-h>', '<c-w>h', { silent = true })
vim.keymap.set('n', '<c-j>', '<c-w>j', { silent = true })
vim.keymap.set('n', '<c-k>', '<c-w>k', { silent = true })
vim.keymap.set('n', '<c-l>', '<c-w>l', { silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Enable `lukas-reineke/indent-blankline.nvim`
-- See `:help indent_blankline.txt`
-- require('indent_blankline').setup {
--   char = '┊',
--   show_trailing_blankline_indent = false,
-- }

-- Gitsigns
-- See `:help gitsigns.txt`
-- require('gitsigns').setup {
--   signs = {
--     add = { text = '+' },
--     change = { text = '~' },
--     delete = { text = '_' },
--     topdelete = { text = '‾' },
--     changedelete = { text = '~' },
--   },
-- }

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.

-- Setup neovim lua configuration
--
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers

-- Turn on lsp status information

-- nvim-cmp setup
-- local cmp = require 'cmp'
-- local luasnip = require 'luasnip'
--
-- cmp.setup {
--   snippet = {
--     expand = function(args)
--       luasnip.lsp_expand(args.body)
--     end,
--   },
--   mapping = cmp.mapping.preset.insert {
--     ['<c-d>'] = cmp.mapping.scroll_docs(-4),
--     ['<c-f>'] = cmp.mapping.scroll_docs(4),
--     ['<c-space>'] = cmp.mapping.complete(),
--     ['<c-y>'] = cmp.mapping.confirm {
--       behavior = cmp.ConfirmBehavior.Replace,
--       select = true,
--     },
--     ['<Tab>'] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_next_item()
--       elseif luasnip.expand_or_jumpable() then
--         luasnip.expand_or_jump()
--       else
--         fallback()
--       end
--     end, { 'i', 's' }),
--     ['<S-Tab>'] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item()
--       elseif luasnip.jumpable(-1) then
--         luasnip.jump(-1)
--       else
--         fallback()
--       end
--     end, { 'i', 's' }),
--   },
--   sources = {
--     { name = 'nvim_lsp' },
--     { name = 'luasnip' },
--   },
-- }

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
        -- You can use the capture groups defined in textobjects.scm
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
      goto_next_start = {
        [']m'] = '@function.outer',
        [']n'] = '@test.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']N'] = '@test.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[n'] = '@test.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[N'] = '@test.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

--maps
vim.api.nvim_set_keymap('n', '<c-h>', '<c-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-j>', '<c-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-k>', '<c-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-l>', '<c-w>l', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'gz', ':e ~/.config/nvim/init.lua<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gx', ':so ~/.config/nvim/init.lua<cr>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<space><space>', '<c-^>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', ',s', ':w<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>hl', ':nohl<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>hf', ':lua vim.lsp.buf.format()<cr>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>ht', ':!mix test %<cr>', { noremap = true, silent = false })
-- vim.api.nvim_set_keymap('n', '<leader>ht', ':call VimuxRunCommand("mix test " . bufname("%"))<cr>', { noremap = true, silent = false })

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>bl', function()
  require('telescope.builtin').buffers(require('telescope.themes').get_dropdown {
    order = 'reverse',
    previewer = false,
  })
end, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', "require('telescope.builtin').find_files", { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<c-p>', function()
  require('telescope.builtin').git_files(require('telescope.themes').get_dropdown {
    order = 'reverse',
    previewer = false,
  })
end, { desc = '[S]earch [F]iles tracked by GIT' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Diagnostic apis
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- noice
require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = false, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true, -- add a border to hover docs and signature help
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
